//
//  Inventory+CoreDataProperties.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//
//

import Foundation
import CoreData


extension Inventory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Inventory> {
        return NSFetchRequest<Inventory>(entityName: "Inventory")
    }

    @NSManaged public var created: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var productId: UUID?
    @NSManaged public var totalPurchaedCost: Double
    @NSManaged public var totalPurchasedQuantity: Int32
    @NSManaged public var totalSaleCost: Double
    @NSManaged public var totalSaleQuantity: Int32
    @NSManaged public var toProduct: NSSet?

}

// MARK: Generated accessors for toProduct
extension Inventory {

    @objc(addToProductObject:)
    @NSManaged public func addToToProduct(_ value: Product)

    @objc(removeToProductObject:)
    @NSManaged public func removeFromToProduct(_ value: Product)

    @objc(addToProduct:)
    @NSManaged public func addToToProduct(_ values: NSSet)

    @objc(removeToProduct:)
    @NSManaged public func removeFromToProduct(_ values: NSSet)

}

extension Inventory : Identifiable {

}
