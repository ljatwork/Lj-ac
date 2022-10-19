//
//  ArtworkListCollectionView+CollectionViewDelegate.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation
import UIKit

extension ArtworkListCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.artworkListResult.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ArtworkViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.artworkLabel.text = viewModel.artworkListResult.value[indexPath.row].name
        cell.setartworkOGImage(viewModel.artworkListResult.value[indexPath.row].imageURL)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Constants.SCREEN_WIDTH - 20) / 2, height: (Constants.SCREEN_HEIGHT - 100) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row >= viewModel.artworkListResult.value.count {
            return
        }
        let art = viewModel.artworkListResult.value[indexPath.row]
        prepareOnPushToDetailsVC(artName: art.name)
    }
    
}


extension ArtworkListCollectionViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        viewModel.artworkListResult.value = viewModel.artworkList.value
    }
}




