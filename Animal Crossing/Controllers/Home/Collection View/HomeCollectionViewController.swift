//
//  HomeCollectionViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import UIKit

class HomeCollectionViewController: UIViewController, LogoutDelegate {
    
    var myCollectionView: UICollectionView = UICollectionView(frame: Constants.screenSize, collectionViewLayout: UICollectionViewLayout())
    var backgroundImge = UIImageView()
    var delegate: LogoutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroud()
        setupNavView()
        setupView()
        initPubNub()
    }
    
    func initPubNub() {
        let username = UserDefaults.standard.getUsername()
        PubNubManager.shared.initPubNub(uuid: username)
    }
    
    func redirectToLogin() {
        delegate?.redirectToLogin()
    }
}

extension HomeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.shared.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionCell.self), for: indexPath) as! HomeCollectionCell
        cell.setImage(imageStr: Constants.shared.menu[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Constants.SCREEN_WIDTH - 10) / 2, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuStr = Constants.shared.menu[indexPath.row]
        guard let menu = Menu(rawValue: menuStr) else {
            return
        }
        pushToView(menu: menu)
    }
    
    func pushToView(menu: Menu) {
        switch menu {
        case .cam:
            let vc = ArtworkListCollectionViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case .camp:
            break
        case .critters:
            let vc = CrittersViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case .design:
            break
        case .diy:
            break
        case .flag:
            break
        case .friends:
            break
        case .map:
            break
        case .globe:
            let vc = VillagerCategoryViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case .message:
            let vc = ChatViewController()
            navigationController?.pushViewController(vc, animated: true)
            break
        case .settings:
            let vc = SettingsViewController()
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
            break
        case .shop:
            break
        case .songs:
            break
        case .update:
            break
        }
        
    }
    
}
