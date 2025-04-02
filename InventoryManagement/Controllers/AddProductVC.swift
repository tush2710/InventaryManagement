//
//  AddProductVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit

class AddProductVC: BaseViewController {
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfQuantity: UITextField!
    @IBOutlet weak var tfCost: UITextField!
    @IBOutlet weak var tfTotalCost: UITextField!
    private let manager: ProductManager = ProductManager()
    var vc : ProductVC?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfCost.text = "0"
        tfTotalCost.text = "0"
        tfTotalCost.isUserInteractionEnabled = false
        tfCost.addTarget(self, action: #selector(costDidChange(_:)), for: .editingChanged)
        
        tfQuantity.addTarget(self, action: #selector(costDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func costDidChange(_ sender: UITextField){
//        sender.text = sender.text == "" ? "0" : sender.text
        let cost = Double(tfCost.text ?? "0") ?? 0
        let quanty = Double(tfQuantity.text ?? "0") ?? 0
        let totalCost = cost * quanty
        tfTotalCost.text = String(format: "%.02f", totalCost)
    }
    
    @IBAction func btnAddDidTapped(_ sender: UIButton) {
        if tfName.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            self.alertMssg(title: "Required!", message: "Please enter product name")
        }else if tfQuantity.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            self.alertMssg(title: "Required!", message: "Please enter quantity")
        }else if tfCost.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            self.alertMssg(title: "Required!", message: "Please enter cost for the product")
        }else if tfTotalCost.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            self.alertMssg(title: "Required!", message: "Please enter total cost for the product")
        }else{
            let product = ProductModel(_id: UUID(), _productName: tfName.text ?? "", _quantity: Int32(Int(tfQuantity.text ?? "0") ?? 0), _cost: Double(tfCost.text ?? "0") ?? 0.0, _totalCost: Double(tfTotalCost.text ?? "0") ?? 0.0, _date: Date())
            manager.createProduct(record: product)
    //        vc?.getProduct()
            self.alertWithOneHandler(title: "", message: "Product Added") { _ in
                self.navigationController?.popViewController(animated: true)
            }
            
            
//            guard let vc = self.storyboard?.instantiateViewController(identifier: "ProductVC") as? ProductVC else { return  }
//            vc.modalPresentationStyle = .fullScreen
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
