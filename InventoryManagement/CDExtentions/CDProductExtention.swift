//
//  CDProductExtention.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
import UIKit
extension Product{
    func convertToProduct() -> ProductModel
    {
        print(self.id!)
        print(self.productName!)
        print(self.quantity)
        print(self.cost)
        print(self.totalCost)
        print(self.date!)
        
        return ProductModel(
            _id: self.id!,
            _productName: self.productName!,
            _quantity: self.quantity,
            _cost: self.cost,
            _totalCost: self.totalCost,
            _date: self.date!
        )
    }
}
