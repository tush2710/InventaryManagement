//
//  ProductVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit

class ProductCell: UITableViewCell{
    @IBOutlet weak var lblUniqueId: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblQuantiry: UILabel!
    @IBOutlet weak var lblCostPerItem: UILabel!
    @IBOutlet weak var lblTotalCost: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnSale: UIButton!
    @IBOutlet weak var btnPurchase: UIButton!
    
}

class ProductVC: BaseViewController {
    @IBOutlet weak var tblProductList: UITableView!
    private let manager: ProductManager = ProductManager()
    var products: [ProductModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products"
        tblProductList.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Products"
        getProduct()
    }
    
    func getProduct(){
        if let product = manager.fetchProduct(){
            products = product
            self.tblProductList.reloadData()
        }
    }
    @IBAction func btnAddProductDidTapped(_ sender: UIButton) {
        guard let addProductVC = self.storyboard?.instantiateViewController(identifier: "AddProductVC") as? AddProductVC else {return}
        addProductVC.modalPresentationStyle = .fullScreen
        addProductVC.vc = self
        self.navigationController?.pushViewController(addProductVC, animated: true)
    }
    

    

}
extension ProductVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.selectionStyle = .none
        let data = products[indexPath.row]
        cell.lblUniqueId.text = "Unique ID: \(data.id)"
        cell.lblItemName.text = data.productName
        cell.lblQuantiry.text = "Quantity : \(Int(data.quantity))"
        cell.lblCostPerItem.text = "Cost : ₹" + String(format: "%.02f", data.cost)
        cell.lblTotalCost.text = "Total Cost: ₹" + String(format: "%.02f", data.totalCost)
        cell.lblDate.text = "Date : \(data.date)"
        
        cell.btnSale.tag = indexPath.row
        cell.btnSale.addTarget(self, action: #selector(btnSaleDidTapped(_:)), for: .touchUpInside)
        
        cell.btnPurchase.tag = indexPath.row
        cell.btnPurchase.addTarget(self, action: #selector(btnPurchaseDidTapped(_:)), for: .touchUpInside)
        print(data)
        return cell
    }
    
    @objc func btnSaleDidTapped(_ sender: UIButton){
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SaleOrderVC") as? SaleOrderVC else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.product = products[sender.tag]
        vc.vc = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnPurchaseDidTapped(_ sender: UIButton){
        guard let vc = self.storyboard?.instantiateViewController(identifier: "PurchasedOrderVC") as? PurchasedOrderVC else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.product = products[sender.tag]
        vc.vc = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
