//
//  InventoryModel.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import UIKit

class InventoryModel
{
    let id: UUID
    let productId: UUID
    let totalSaleQuantity : Int32
    let totalPurchasedQuantity: Int32
    let totalSaleCost: Double
    let totalPurchaedCost: Double
    let created : Date
    
    
    
    
    init(_id: UUID, _productId: UUID, _totalSaleQuantity:Int32, _totalPurchasedQuantity: Int32, _totalSaleCost: Double, _totalPurchasedCost: Double, _created: Date)
    {
        self.id = _id
        self.productId = _productId
        self.totalSaleQuantity = _totalSaleQuantity
        self.totalPurchasedQuantity = _totalPurchasedQuantity
        self.totalSaleCost = _totalSaleCost
        self.totalPurchaedCost = _totalPurchasedCost
        self.created = _created
    }
}
