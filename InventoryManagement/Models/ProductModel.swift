//
//  ProductModel.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import UIKit

class ProductModel
{
    let id: UUID
    let productName: String
    let quantity: Int32
    let cost: Double
    let totalCost: Double
    let date: Date
    var toPurchase: [PurchaseModel]?
    var toSale: [SaleModel]?

    init(_id: UUID, _productName: String,_quantity : Int32, _cost: Double,_totalCost: Double, _date: Date , _purchase: [PurchaseModel]? = nil, _sale: [SaleModel]? = nil)
    {
        self.id = _id
        self.productName = _productName
        self.quantity = _quantity
        self.cost = _cost
        self.totalCost = _totalCost
        self.date = _date
        self.toPurchase = _purchase
        self.toSale = _sale
    }
}
