//
//  ProductRepository.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import CoreData
protocol ProductRepository : BaseRepository {

}

struct ProductDataRepository : ProductRepository {
    
    
    typealias T = ProductModel
    
    

    func create(record: ProductModel) {

        let product = Product(context: PersistentStorage.shared.context)
        product.id = record.id
        product.productName = record.productName
        product.quantity = record.quantity
        product.cost = record.cost
        product.date = Date()
        product.totalCost = record.totalCost
        PersistentStorage.shared.saveContext()

//        if(record.vehicles != nil && record.vehicles?.count != 0)
//        {
//            var vehicleSet = Set<CDVehicle>()
//            record.vehicles?.forEach({ (vehicle) in
//
//                let cdVehicle = CDVehicle(context: PersistentStorage.shared.context)
//                cdVehicle.id = vehicle.id
//                cdVehicle.type = vehicle.type
//                cdVehicle.name = vehicle.name
//
//                vehicleSet.insert(cdVehicle)
//            })
//
//            cdProduct.toVehicle = vehicleSet
//        }
    }

    func getAll() -> [ProductModel]? {

        let records = PersistentStorage.shared.fetchManagedObject(managedObject: Product.self)
        guard records != nil && records?.count != 0 else {return nil}

        var results: [ProductModel] = []
        records!.forEach({ (cdProduct) in
            results.append(cdProduct.convertToProduct())
        })

        return results
    }

    func get(byIdentifier id: UUID) -> ProductModel? {

        let Product = getCdProduct(byId: id)
        guard Product != nil else {return nil}

        return (Product?.convertToProduct())!
    }

    func update(record: ProductModel) -> Bool {

        let product = getCdProduct(byId: record.id)
        guard product != nil else {return false}
        
        product!.id = record.id
        product!.productName = record.productName
        product!.quantity = record.quantity
        product!.cost = record.cost
        product!.date = Date()
        product!.totalCost = record.totalCost

        PersistentStorage.shared.saveContext()
        return true
    }

    func delete(byIdentifier id: UUID) -> Bool {

        let Product = getCdProduct(byId: id)
        guard Product != nil else {return false}

        PersistentStorage.shared.context.delete(Product!)
        PersistentStorage.shared.saveContext()

        return true
    }

    private func getCdProduct(byId id: UUID) -> Product?{
        let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
        let fetchById = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = fetchById

        let result = try! PersistentStorage.shared.context.fetch(fetchRequest)
        guard result.count != 0 else {return nil}

        return result.first
    }




}
