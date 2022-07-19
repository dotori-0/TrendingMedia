//
//  ShoppingTableViewController.swift
//  TrendingMedia
//
//  Created by SC on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var textFieldContainerView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldContainerView.configureTextFieldContainerViewDesign()
        textField.backgroundColor = .clear
//        textField.layer.borderColor = UIColor.black.cgColor  // X
        textField.borderStyle = .none
    }

    

}
