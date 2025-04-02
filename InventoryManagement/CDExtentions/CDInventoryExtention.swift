//
//  CDInventoryExtention.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
extension Inventory{
    func convertToInventory() -> InventoryModel
    {
        return InventoryModel(_id: self.id!, _productId: self.productId!, _totalSaleQuantity: self.totalSaleQuantity, _totalPurchasedQuantity: self.totalPurchasedQuantity, _totalSaleCost: self.totalSaleCost, _totalPurchasedCost: self.totalPurchaedCost, _created: self.created!)
    }
}
