//
//  VillagerListView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import Foundation
import UIKit
import ReactiveSwift
import ReactiveCocoa

extension VillagerListViewController {
    func setupView() {
        setupNavView()
        setBackgroud()
        setupCollectionView()
        setupSearchBar()
    }
    
    func setupCollectionView() {
        title = L10n.villagers
        
        // - tableview
        villagersTableView.contentInset = UIEdgeInsets(top: -10, left: 0, bottom: 15, right: 0)
        villagersTableView.delegate = self
        villagersTableView.dataSource = self
        villagersTableView.backgroundColor = .clear
        villagersTableView.tableFooterView = UIView()
        villagersTableView.separatorStyle = .none
        villagersTableView.register(VillagersCell.self, forCellReuseIdentifier: String(describing: VillagersCell.self))
        view.addSubview(villagersTableView)
        
        villagersTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.view = view
    }
    
    func setupViewModelBindings() {
        viewModel.villagersResult.signal.observeValues { [weak self] _ in
            DispatchQueue.main.async {
                self?.villagersTableView.reloadData()
            }
        }
        bindSearchController()
    }
    
    func bindSearchController() {
        if let searchController = navigationItem.searchController {
            searchController.searchBar.reactive.continuousTextValues.observeValues { [weak self] (value) in
                if let val = value {
                    self?.viewModel.didSearchBarValueChanged(value: val)
                }
            }
        }
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = L10n.searchAVillager
        searchBar.searchBar.delegate = self
        navigationItem.searchController = searchBar
        definesPresentationContext = true
    }
    
    func prepareOnPushToDetailsVC(villagerName: String) {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "species", value: specie.rawValue),
            URLQueryItem(name: "game", value: "NH"),
            URLQueryItem(name: "name", value: villagerName)
        ]
        let vc = DetailsViewController(detailType: .villager, queryItems: queryItems)
        navigationController?.pushViewController(vc, animated: true)
    }
}
