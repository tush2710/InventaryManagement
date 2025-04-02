//
//  Product+CoreDataProperties.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var cost: Double
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var productName: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var totalCost: Double
    @NSManaged public var toInventory: Inventory?
    @NSManaged public var toPurchase: Purchase?
    @NSManaged public var toSale: Sale?

}

extension Product : Identifiable {

}
