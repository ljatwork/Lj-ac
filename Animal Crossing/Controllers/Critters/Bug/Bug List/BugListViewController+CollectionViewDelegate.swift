//
//  BugListViewController+CollectionViewDelegate.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation
import UIKit

extension BugListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.bugListResult.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CrittersViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.critterLabel.text = viewModel.bugListResult.value[indexPath.row].name
        cell.setCritterImage(viewModel.bugListResult.value[indexPath.row].imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Constants.SCREEN_WIDTH - 40) / 3, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row >= viewModel.bugListResult.value.count {
            return
        }
        let bug = viewModel.bugListResult.value[indexPath.row]
        prepareOnPushToDetailsVC(bugName: bug.name)
    }
    
}


extension BugListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        viewModel.bugListResult.value = viewModel.bugList.value
    }
}


