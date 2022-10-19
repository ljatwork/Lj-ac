//
//  VillagerListDelegate.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import Foundation
import SnapKit

extension VillagerListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel == nil {
            return 0
        } else {
            return viewModel.villagersResult.value.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = villagersTableView.dequeueReusableCell(withIdentifier: String(describing: VillagersCell.self), for: indexPath) as! VillagersCell
        cell.selectionStyle = .none
        if indexPath.row < viewModel.villagersResult.value.count {
            cell.setVillagerData(villager: viewModel.villagersResult.value[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= viewModel.villagersResult.value.count {
            return
        }
        let villager = viewModel.villagersResult.value[indexPath.row]
        prepareOnPushToDetailsVC(villagerName: villager.name)
    }
}

extension VillagerListViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        viewModel.villagersResult.value = viewModel.villagerList.value
    }
}
