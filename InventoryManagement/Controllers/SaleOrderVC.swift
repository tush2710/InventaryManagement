//
//  SaleOrderVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit

class SaleOrderVC: BaseViewController {
    private let manager: ProductManager = ProductManager()
    private let saleManager: SaleManager = SaleManager()
    @IBOutlet weak var lblAvailableQuantity: UILabel!
    @IBOutlet weak var tfQtyWantSale: UITextField!
    @IBOutlet weak var tfTotalCost: UITextField!
    

    var product: ProductModel?
    var vc: ProductVC?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAvailableQuantity.text = "Available Quantity: \(product!.quantity)"
        tfQtyWantSale.addTarget(self, action: #selector(qtyDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func qtyDidChange(_ sender: UITextField){
        let qty = Int((tfQtyWantSale.text == "" ? "0" : tfQtyWantSale.text) ?? "0") ?? 0
        if qty <= product!.quantity{
            if let cost = product?.cost, let qty = Double((tfQtyWantSale.text == "" ? "0" : tfQtyWantSale.text) ?? "0"){
                let totalCost = cost * qty
                tfTotalCost.text = "\(totalCost)"
            }
        }else{
            tfQtyWantSale.text = "\(tfQtyWantSale.text!.dropLast())"
        }
    }
    
    @IBAction func btnSaleDidTapped(_ sender: UIButton) {
        if tfQtyWantSale.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            self.alertMssg(title: "Required!", message: "Please enter quantity that you want to sale")
        }else{
            let remainingQty = product!.quantity - Int32(tfQtyWantSale.text ?? "0")!
            let remainingTotalCost = Double(remainingQty ) * product!.cost
                    
            let productData = ProductModel(_id: product!.id, _productName: product!.productName, _quantity: remainingQty, _cost: product!.cost, _totalCost: remainingTotalCost, _date: product!.date)

            
            let saleOrder = SaleModel(_id: UUID(), _productId: product!.id, _saleQuantity: Double(tfQtyWantSale.text ?? "0") ?? 0.0, _totalCost: Double(tfTotalCost.text ?? "0") ?? 0, _created: Date(), _product: productData)
            saleManager.createSale(record: saleOrder)
            
            if manager.updateProduct(product: productData){
                self.alertWithOneHandler(title: "", message: "Items Sold") { _ in
                    self.vc?.getProduct()
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}

