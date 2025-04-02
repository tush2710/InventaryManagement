//
//  PurchaseManager.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
struct PurchaseManager
{
    private let _purchaseDataRepository = PurchaseDataRepository()
    
    func createPurchase(record: PurchaseModel) {
        _purchaseDataRepository.create(record: record)
    }

    func fetchPurchase() -> [PurchaseModel]? {
        return _purchaseDataRepository.getAll()
    }

    func fetchPurchase(byIdentifier id: UUID) -> PurchaseModel?
    {
        return _purchaseDataRepository.get(byIdentifier: id)
    }

    func updatePurchase(record: PurchaseModel) -> Bool {
        return _purchaseDataRepository.update(record: record)
    }

    func deleteSale(id: UUID) -> Bool {
        return _purchaseDataRepository.delete(byIdentifier: id)
    }
}
