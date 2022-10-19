//
//  HomeViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import UIKit
import SnapKit

/**
* https://medium.com/cocoaacademymag/how-to-write-auto-layout-constraints-with-snapkit-in-ios-c5f95c7c695d
*/
class HomeViewController: UIViewController {
    var homeTableView = UITableView()
    var backgroundImge = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.shared.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = homeTableView.dequeueReusableCell(withIdentifier: String(describing: HomeViewCell.self), for: indexPath) as? HomeViewCell {
            cell.selectionStyle = .none
            cell.setImage(imageStr: Constants.shared.menu[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
