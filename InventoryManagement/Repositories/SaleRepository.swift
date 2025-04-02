//
//  SaleRepository.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import CoreData
protocol SaleRepository : BaseRepository {

}

struct SaleDataRepository : SaleRepository {
    
    typealias T = SaleModel
    
    

    func create(record: SaleModel) {

        let saleOrder = Sale(context: PersistentStorage.shared.context)
        saleOrder.id = record.id
        saleOrder.productId = record.productId
        saleOrder.saleQuantity = record.saleQuantity
        saleOrder.totalCost = record.totalCost
        saleOrder.created = Date()
        
        let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
        let fetchById = NSPredicate(format: "id==%@", record.productId as CVarArg)
        fetchRequest.predicate = fetchById

        if let result = try! PersistentStorage.shared.context.fetch(fetchRequest).first{
            saleOrder.toProduct = result
        }
        
        PersistentStorage.shared.saveContext()
    }

    func getAll() -> [SaleModel]? {

        let records = PersistentStorage.shared.fetchManagedObject(managedObject: Sale.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [SaleModel] = []
        records!.forEach({ (cdSale) in
            results.append(cdSale.convertToSale())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> SaleModel? {

        let saleOrder = getCdSaleOrder(byId: id)
        guard saleOrder != nil else {return nil}

        return (saleOrder?.convertToSale())!
    }

    func update(record: SaleModel) -> Bool {

        let saleOrder = getCdSaleOrder(byId: record.id)
        guard saleOrder != nil else {return false}
        saleOrder?.id = record.id
        saleOrder?.productId = record.productId
        saleOrder?.saleQuantity = record.saleQuantity
        saleOrder?.totalCost = record.totalCost
        saleOrder?.created = Date()

        PersistentStorage.shared.saveContext()
        return true
    }

    func delete(byIdentifier id: UUID) -> Bool {

        let order = getCdSaleOrder(byId: id)
        guard order != nil else {return false}

        PersistentStorage.shared.context.delete(order!)
        PersistentStorage.shared.saveContext()

        return true
    }

    private func getCdSaleOrder(byId id: UUID) -> Sale?
    {
        let fetchRequest = NSFetchRequest<Sale>(entityName: "Sale")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }
}
