//
//  Sale+CoreDataProperties.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//
//

import Foundation
import CoreData


extension Sale {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sale> {
        return NSFetchRequest<Sale>(entityName: "Sale")
    }

    @NSManaged public var created: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var productId: UUID?
    @NSManaged public var saleQuantity: Double
    @NSManaged public var totalCost: Double
    @NSManaged public var toProduct: Product?

}

extension Sale : Identifiable {

}
