//
//  ProductManager.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import Foundation
struct ProductManager
{
    private let _productDataRepository = ProductDataRepository()
    
    func createProduct(record: ProductModel) {
        _productDataRepository.create(record: record)
    }

    func fetchProduct() -> [ProductModel]? {
        return _productDataRepository.getAll()
    }

    func fetchProduct(byIdentifier id: UUID) -> ProductModel?{
        return _productDataRepository.get(byIdentifier: id)
    }

    func updateProduct(product: ProductModel) -> Bool {
        return _productDataRepository.update(record: product)
    }

    func deleteProduct(id: UUID) -> Bool {
        return _productDataRepository.delete(byIdentifier: id)
    }
}
