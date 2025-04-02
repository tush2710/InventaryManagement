//
//  Purchase+CoreDataProperties.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//
//

import Foundation
import CoreData


extension Purchase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Purchase> {
        return NSFetchRequest<Purchase>(entityName: "Purchase")
    }

    @NSManaged public var created: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var productId: UUID?
    @NSManaged public var purchasedQuantity: Int32
    @NSManaged public var totalCost: Double
    @NSManaged public var toProduct: Product?

}

extension Purchase : Identifiable {

}
