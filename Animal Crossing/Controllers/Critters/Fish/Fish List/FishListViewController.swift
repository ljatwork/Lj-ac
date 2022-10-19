//
//  FishListViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/7/20.
//

import UIKit
import SnapKit

class FishListViewController: UIViewController {
    var myCollectionView: UICollectionView = UICollectionView(frame: Constants.screenSize, collectionViewLayout: UICollectionViewLayout())
    var backgroundImge = UIImageView()
    var viewModel: FishViewModel!
    var searchBar = UISearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension FishListViewController {
    func setupView(){
        setupNavView()
        setBackgroud()
        setupCollectionView()
        setupSearchBar()
    }
    
    func setupCollectionView() {
        title = L10n.fish
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        myCollectionView.setCollectionViewLayout(layout, animated: false)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(CrittersViewCell.self)
        myCollectionView.backgroundColor = .clear
        view.addSubview(myCollectionView)
       
        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myCollectionView.reloadData()
    }
    
    func initViewModel() {
        displayLoadingScreen()
        viewModel = FishViewModel()
        setupViewModelBindings()
    }
    
    func setupViewModelBindings() {
        viewModel.fishListResult.signal.observeValues { [weak self] _ in
            DispatchQueue.main.async {
                self?.myCollectionView.reloadData()
            }
        }
        bindSearchController()
    }
    
    func bindSearchController() {
        if let searchController = navigationItem.searchController {
            searchController.searchBar.reactive.continuousTextValues.observeValues { [weak self] (value) in
                if let val = value {
                    self?.viewModel.didSearchBarValueChanged(value: val)
                }
            }
        }
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.obscuresBackgroundDuringPresentation = false
        searchBar.searchBar.placeholder = L10n.searchAFish
        searchBar.searchBar.delegate = self
        navigationItem.searchController = searchBar
        definesPresentationContext = true
    }
    
    func prepareOnPushToDetailsVC(fishName: String) {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "name", value: fishName)
        ]
        let vc = DetailsViewController(detailType: .fish, queryItems: queryItems)
        navigationController?.pushViewController(vc, animated: true)
    }
}
