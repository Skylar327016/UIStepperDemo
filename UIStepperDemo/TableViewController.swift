//
//  TableViewController.swift
//  UIStepperDemo
//
//  Created by 陳家豪 on 2020/7/27.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {

    var prices = [Double]()
    @IBOutlet weak var total: UILabel!
    @IBOutlet var list: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTotal()
    }
    
    @IBAction func changeQuantity(_ sender: UIStepper) {
        if let parentView = sender.superview{
            if let qty = parentView.viewWithTag(10) as? UILabel{
                qty.text = "\(Int(sender.value))"
            }
        }
        updateTotal()
    }
    
    func getPrice(from priceTag:String)->Double{
        var correctPrice = 0.0
        let priceArray = priceTag.components(separatedBy: "$")
        if let price = Double(priceArray[1]){
            correctPrice = price
        }
        return correctPrice
    }
    func updateTotal(){
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        var totalPrice = 0.0
        var cells = [UITableViewCell]()
        for childView in tableView.subviews{
            if let view = childView as? UITableViewCell{
                cells.append(view)
            }
        }
        for cell in cells{
            var price = 0.0
            var quantity = 0
            print("cells.count = \(cells.count)")
            if let priceTag = cell.viewWithTag(100) as? UILabel{
                price = getPrice(from: priceTag.text!)
                print("price = \(price)")
            }
            if let qtyTag = cell.viewWithTag(10) as? UILabel{
                if let qty = qtyTag.text{
                    quantity = Int(qty)!
                    print("quantity = \(quantity)")
                }
            }
            totalPrice += price * Double(quantity)
        }
        total.text = formatter.string(from: NSNumber(value: totalPrice))
        print("執行結束")
        
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
