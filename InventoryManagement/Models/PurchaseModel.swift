//
//  PurchaseModel.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import UIKit

class PurchaseModel
{
    let id: UUID
    let productId: UUID
    let purchasedQuantity: Int32
    let totalCost: Double
    let created: Date
    let product: ProductModel?

    init(_id: UUID, _productId: UUID, _purchasedQty:Int32, _totalCost:Double, _created: Date, _product: ProductModel)
    {
        self.id = _id
        self.productId = _productId
        self.purchasedQuantity = _purchasedQty
        self.totalCost = _totalCost
        self.created = _created
        self.product = _product
    }
}
