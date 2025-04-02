//
//  CDSaleExtention.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
extension Sale{
    func convertToSale() -> SaleModel
    {
        return SaleModel(_id: self.id!, _productId: self.productId!, _saleQuantity: self.saleQuantity, _totalCost: self.totalCost, _created: self.created!, _product: self.toProduct!.convertToProduct())
    }
}
