//
//  SaleManager.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
struct SaleManager
{
    private let _saleDataRepository = SaleDataRepository()
    
    func createSale(record: SaleModel) {
        _saleDataRepository.create(record: record)
    }

    func fetchSale() -> [SaleModel]? {
        return _saleDataRepository.getAll()
    }

    func fetchSale(byIdentifier id: UUID) -> SaleModel?
    {
        return _saleDataRepository.get(byIdentifier: id)
    }

    func updateSale(product: SaleModel) -> Bool {
        return _saleDataRepository.update(record: product)
    }

    func deleteSale(id: UUID) -> Bool {
        return _saleDataRepository.delete(byIdentifier: id)
    }
}
