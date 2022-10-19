//
//  Critters+TableView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/3/20.
//

import Foundation
import UIKit

extension CrittersViewController {
    func setupView() {
        setupNavView()
        setBackgroud()
        setupTableView()
    }
    
    func setupTableView() {
        title = L10n.villagers
        
        // - tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(CrittersMenuViewCell.self)
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
 
extension CrittersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Critters.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CrittersMenuViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.critterImageView.image = Critters.allCases[indexPath.row].image
        cell.critterLabel.text = Critters.allCases[indexPath.row].localizedDescription
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let critterType = Critters.allCases[indexPath.row]
        switch critterType {
        case .bug:
            let vc = BugListViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case .fish:
            let vc = FishListViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case .fossil:
            break
        case .seaCreatures:
            let vc = SeaCreatureListViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
}
