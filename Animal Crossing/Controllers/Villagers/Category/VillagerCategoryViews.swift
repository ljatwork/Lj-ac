//
//  VillagerCategoryViews.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import Foundation
import UIKit
import SnapKit

extension VillagerCategoryViewController {
    func setupView(){
        setupNavView()
        setBackgroud()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        title = L10n.villagerSpecies
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        myCollectionView.setCollectionViewLayout(layout, animated: false)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(VillagersCategoryCell.self, forCellWithReuseIdentifier: String(describing: VillagersCategoryCell.self))
        myCollectionView.backgroundColor = .clear
        view.addSubview(myCollectionView)
       
        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myCollectionView.reloadData()
    }
}

