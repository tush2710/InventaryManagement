//
//  PurchaseRepository.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import CoreData
protocol PurchaseRepository : BaseRepository {

}

struct PurchaseDataRepository : PurchaseRepository {
    
    typealias T = PurchaseModel
    
    func create(record: PurchaseModel) {

        let purchaseOrder = Purchase(context: PersistentStorage.shared.context)
        purchaseOrder.id = record.id
        purchaseOrder.productId = record.productId
        purchaseOrder.purchasedQuantity = record.purchasedQuantity
        purchaseOrder.totalCost = record.totalCost
        purchaseOrder.created = Date()
        
        let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
        let fetchById = NSPredicate(format: "id==%@", record.productId as CVarArg)
        fetchRequest.predicate = fetchById

        if let result = try! PersistentStorage.shared.context.fetch(fetchRequest).first{
            purchaseOrder.toProduct = result
        }
        
        PersistentStorage.shared.saveContext()
    }

    func getAll() -> [PurchaseModel]? {

        let records = PersistentStorage.shared.fetchManagedObject(managedObject: Purchase.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [PurchaseModel] = []
        records!.forEach({ (cdSale) in
            results.append(cdSale.convertToPurchase())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> PurchaseModel? {

        let purchaseOrder = getCdPurchaseOrder(byId: id)
        guard purchaseOrder != nil else {return nil}

        return (purchaseOrder?.convertToPurchase())!
    }

    func update(record: PurchaseModel) -> Bool {

        let saleOrder = getCdPurchaseOrder(byId: record.id)
        guard saleOrder != nil else {return false}
        saleOrder?.id = record.id
        saleOrder?.productId = record.productId
        saleOrder?.purchasedQuantity = record.purchasedQuantity
        saleOrder?.totalCost = record.totalCost
        saleOrder?.created = Date()

        PersistentStorage.shared.saveContext()
        return true
    }

    func delete(byIdentifier id: UUID) -> Bool {

        let order = getCdPurchaseOrder(byId: id)
        guard order != nil else {return false}

        PersistentStorage.shared.context.delete(order!)
        PersistentStorage.shared.saveContext()

        return true
    }

    private func getCdPurchaseOrder(byId id: UUID) -> Purchase?
    {
        let fetchRequest = NSFetchRequest<Purchase>(entityName: "Purchase")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
}
