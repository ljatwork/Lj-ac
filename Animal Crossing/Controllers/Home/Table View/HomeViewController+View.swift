//
//  HomeViewController+View.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import Foundation
import UIKit

extension HomeViewController {
    
    func setupView(){
        setupCollectionView()
    }
    
    func setupCollectionView() {
        // - image BG
        title = L10n.animalCrossing
        backgroundImge.image = #imageLiteral(resourceName: "bg")
        backgroundImge.contentMode = .scaleAspectFill
        view.addSubview(backgroundImge)
        backgroundImge.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // - tableview
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.backgroundColor = .clear
        homeTableView.tableFooterView = UIView()
        homeTableView.separatorStyle = .none
        homeTableView.register(HomeViewCell.self, forCellReuseIdentifier: String(describing: HomeViewCell.self))
        view.addSubview(homeTableView)
        
        homeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.view = view
        homeTableView.reloadData()
    }
}
