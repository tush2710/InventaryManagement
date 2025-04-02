//
//  PurchasedOrderListVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit
class PurchasedOrderrCell: UITableViewCell {
    @IBOutlet weak var lblUniqueId: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblQuantiry: UILabel!
    @IBOutlet weak var lblCostPerItem: UILabel!
    @IBOutlet weak var lblTotalCost: UILabel!
    @IBOutlet weak var lblDate: UILabel!
}
class PurchasedOrderListVC: BaseViewController {
    @IBOutlet weak var tblPurchasedOrder: UITableView!
    private let purchaseManager: PurchaseManager = PurchaseManager()
    var purchasedOrders: [PurchaseModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Purchased Products"
        tblPurchasedOrder.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Purchased Products"
        getOrders()
    }
    
    func getOrders(){
        if let purchasedOrder = purchaseManager.fetchPurchase(){
            purchasedOrders = purchasedOrder
            self.tblPurchasedOrder.reloadData()
        }
    }
    
}
extension PurchasedOrderListVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchasedOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchasedOrderrCell", for: indexPath) as! PurchasedOrderrCell
        cell.selectionStyle = .none
        let data = purchasedOrders[indexPath.row]
        cell.lblUniqueId.text = "Unique ID: \(data.productId)"
        cell.lblItemName.text = data.product?.productName ?? ""
        cell.lblQuantiry.text = "Quantity Sale : \(Int(data.purchasedQuantity))"
        cell.lblCostPerItem.text = "Cost Per Item : ₹" + String(format: "%.02f", data.product?.cost ?? 0)
        cell.lblTotalCost.text = "Total Cost: ₹" + String(format: "%.02f", data.totalCost)
        cell.lblDate.text = "Date : \(data.created)"
        
        print(data)
        return cell
    }
}
