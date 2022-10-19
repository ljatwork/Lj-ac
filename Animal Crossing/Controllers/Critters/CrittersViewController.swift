//
//  CrittersViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/3/20.
//

import UIKit

class CrittersViewController: UIViewController {
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
}
