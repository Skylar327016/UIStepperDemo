//
//  TableViewController.swift
//  UIStepperDemo
//
//  Created by 陳家豪 on 2020/7/27.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {

    var prices = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTotal()
    }
    
    @IBAction func changeQuantity(_ sender: UIStepper) {
        let quantity = sender.value
        var price = 0.0
        if let parentView = sender.superview{
            if let qty = parentView.viewWithTag(10) as? UILabel{
                qty.text = "\(Int(sender.value))"
            }
            if let priceTag = parentView.viewWithTag(100) as? UILabel{
                price = getPrice(from: priceTag.text!)
            }
            prices[sender.tag] = quantity * price
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
        for i in 0..<prices.count{
            totalPrice += prices[i]
        }
        total.text = formatter.string(from: NSNumber(value: totalPrice))
    }
   
}
