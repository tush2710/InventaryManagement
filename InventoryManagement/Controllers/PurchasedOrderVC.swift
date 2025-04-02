//
//  PurchasedOrderVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit

class PurchasedOrderVC: BaseViewController {

    private let manager: ProductManager = ProductManager()
    private let purchaseManager: PurchaseManager = PurchaseManager()
    @IBOutlet weak var lblAvailableQuantity: UILabel!
    @IBOutlet weak var tfQtyWantPurchase: UITextField!
    @IBOutlet weak var tfTotalCost: UITextField!
    
    var product: ProductModel?
    var vc: ProductVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAvailableQuantity.text = "Available Quantity: \(product!.quantity)"
        tfQtyWantPurchase.addTarget(self, action: #selector(qtyDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func qtyDidChange(_ sender: UITextField){
        if let cost = product?.cost, let qty = Double((tfQtyWantPurchase.text == "" ? "0" : tfQtyWantPurchase.text) ?? "0"){
            let totalCost = cost * qty
            tfTotalCost.text = "\(totalCost)"
        }
    }
    

    @IBAction func btnPurchaseDidTapped(_ sender: UIButton) {
        if tfQtyWantPurchase.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            self.alertMssg(title: "Required!", message: "Please enter quantity you want to purchase")
        }else{
            let totalQty = product!.quantity + Int32(tfQtyWantPurchase.text ?? "0")!
            let totalCost = Double(totalQty ) * product!.cost
                        
            let productData = ProductModel(_id: product!.id, _productName: product!.productName, _quantity: totalQty, _cost: product!.cost, _totalCost: totalCost, _date: product!.date)
            
            let purchaseOrder = PurchaseModel(_id: UUID(), _productId: product!.id, _purchasedQty: Int32(tfQtyWantPurchase.text ?? "0") ?? 0, _totalCost: Double(tfTotalCost.text ?? "0") ?? 0, _created: Date(), _product: productData)
            purchaseManager.createPurchase(record: purchaseOrder)
            
            if manager.updateProduct(product: productData){
                self.alertWithOneHandler(title: "", message: "Items Purchased") { _ in
                    self.vc?.getProduct()
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
