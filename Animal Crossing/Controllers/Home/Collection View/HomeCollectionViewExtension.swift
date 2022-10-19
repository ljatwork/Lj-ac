//
//  HomeCollectionViewExtension.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import Foundation
import UIKit
import SnapKit

extension HomeCollectionViewController {
    func setupView(){
        setupCollectionView()
    }
    func setupCollectionView() {
        title = L10n.animalCrossing
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        myCollectionView.setCollectionViewLayout(layout, animated: false)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: String(describing: HomeCollectionCell.self))
        myCollectionView.backgroundColor = .clear
        view.addSubview(myCollectionView)
       
        myCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.leading.trailing.equalToSuperview()
        }
        myCollectionView.reloadData()
    }
}
