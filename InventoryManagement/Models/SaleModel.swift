//
//  SaleModel.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import UIKit

class SaleModel
{
    let id: UUID
    let productId: UUID
    let saleQuantity: Double
    let totalCost: Double
    let created: Date
    let product: ProductModel?

    init(_id: UUID, _productId: UUID, _saleQuantity:Double, _totalCost:Double, _created: Date, _product: ProductModel)
    {
        self.id = _id
        self.productId = _productId
        self.saleQuantity = _saleQuantity
        self.totalCost = _totalCost
        self.created = _created
        self.product = _product
    }
}

