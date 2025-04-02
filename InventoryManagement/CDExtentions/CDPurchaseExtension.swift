//
//  CDPurchaseExtension.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
extension Purchase{
    func convertToPurchase() -> PurchaseModel
    {
        return PurchaseModel(_id: self.id!, _productId: self.productId!, _purchasedQty: self.purchasedQuantity, _totalCost: self.totalCost, _created: self.created!, _product: self.toProduct!.convertToProduct())
    }
}
