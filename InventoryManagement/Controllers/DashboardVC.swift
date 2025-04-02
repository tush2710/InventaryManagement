//
//  DashboardVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit

class DashboardVC: BaseViewController {
    @IBOutlet weak var lblTotalProduct: UILabel!
    @IBOutlet weak var lblTotalPurchase: UILabel!
    @IBOutlet weak var lblTotalSale: UILabel!
    private let manager: ProductManager = ProductManager()
    private let purchaseManager: PurchaseManager = PurchaseManager()
    private let saleManager: SaleManager = SaleManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let product = manager.fetchProduct(){
            lblTotalProduct.text = "\(product.count)"
            
        }
        
        if let purchasedOrder = purchaseManager.fetchPurchase(){
            var totalPurchase : Double = 0.0
            purchasedOrder.forEach { (record) in
                totalPurchase = totalPurchase + record.totalCost
                lblTotalPurchase.text = "₹ " + String(format: "%.02f", totalPurchase)
            }
        }
        
        if let saleOrder = saleManager.fetchSale(){
            var totalSale : Double = 0.0
            saleOrder.forEach { (record) in
                totalSale = totalSale + record.totalCost
                lblTotalSale.text = "₹ " + String(format: "%.02f", totalSale)
            }
        }
    }
    
    @IBAction func btnAddProductDidTapped(_ sender: UIButton) {
        guard let addProductVC = self.storyboard?.instantiateViewController(identifier: "AddProductVC") as? AddProductVC else {return}
        addProductVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(addProductVC, animated: true)
    }
    
    @IBAction func btnViewTotalProductDidTapped(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ProductVC") as? ProductVC else { return  }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnViewTotalPurchase(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "PurchasedOrderListVC") as? PurchasedOrderListVC else { return}
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnViewTotalSale(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SaleOrderListVC") as? SaleOrderListVC else { return }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
