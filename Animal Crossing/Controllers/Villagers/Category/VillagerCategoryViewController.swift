//
//  VillagerCategoryViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import UIKit

class VillagerCategoryViewController: UIViewController {
    var myCollectionView: UICollectionView = UICollectionView(frame: Constants.screenSize, collectionViewLayout: UICollectionViewLayout())
    var backgroundImge = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension VillagerCategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Species.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: VillagersCategoryCell.self), for: indexPath) as! VillagersCategoryCell
        cell.setLabel(Species.allCases[indexPath.row].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Constants.SCREEN_WIDTH - 30) / 2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = VillagerListViewController()
        vc.specie = Species.allCases[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
