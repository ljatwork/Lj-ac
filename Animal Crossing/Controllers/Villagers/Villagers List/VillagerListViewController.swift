//
//  VillagerListViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import UIKit
import ReactiveSwift

class VillagerListViewController: UIViewController {
    var villagersTableView = UITableView()
    var viewModel: VillagersViewModel!
    var specie: Species!
    var searchBar = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func initViewModel() {
        displayLoadingScreen()
        viewModel = VillagersViewModel(specie: specie)
        setupViewModelBindings()
    }
}
