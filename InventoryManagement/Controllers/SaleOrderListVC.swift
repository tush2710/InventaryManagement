//
//  SaleOrderListVC.swift
//  InventoryManagement
//
//  Created by Harrier information system on 02/11/21.
//

import UIKit
class SaleOrderCell: UITableViewCell {
    @IBOutlet weak var lblUniqueId: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblQuantiry: UILabel!
    @IBOutlet weak var lblCostPerItem: UILabel!
    @IBOutlet weak var lblTotalCost: UILabel!
    @IBOutlet weak var lblDate: UILabel!
}
class SaleOrderListVC: BaseViewController {

    @IBOutlet weak var tblSaleOrder: UITableView!
    private let saleManager: SaleManager = SaleManager()
    var saleOrders: [SaleModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sold Products"
        tblSaleOrder.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.title = "Sale Products"
        getOrders()
    }

    func getOrders(){
        if let saleOrder = saleManager.fetchSale(){
            saleOrders = saleOrder
            self.tblSaleOrder.reloadData()
        }
    }
}
extension SaleOrderListVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saleOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SaleOrderCell", for: indexPath) as! SaleOrderCell
        cell.selectionStyle = .none
        let data = saleOrders[indexPath.row]
        cell.lblUniqueId.text = "Unique ID: \(data.productId)"
        cell.lblItemName.text = data.product?.productName ?? ""
        cell.lblQuantiry.text = "Quantity Sale : \(Int(data.saleQuantity))"
        cell.lblCostPerItem.text = "Cost Per Item : ₹" + String(format: "%.02f", data.product?.cost ?? 0)
        cell.lblTotalCost.text = "Total Cost: ₹" + String(format: "%.02f", data.totalCost)
        cell.lblDate.text = "Date : \(data.created)"
        
        print(data)
        return cell
    }
}
