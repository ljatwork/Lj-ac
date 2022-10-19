//
//  ArtworkListCollectionViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import UIKit
import SnapKit

class ArtworkListCollectionViewController: UIViewController {
    var myCollectionView: UICollectionView = UICollectionView(frame: Constants.screenSize, collectionViewLayout: UICollectionViewLayout())
    var backgroundImge = UIImageView()
    var viewModel: ArtworkViewModel!
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

extension ArtworkListCollectionViewController {
    func setupView(){
        setupNavView()
        setBackgroud()
        setupCollectionView()
        setupSearchBar()
    }
    
    func setupCollectionView() {
        title = L10n.artwork
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        myCollectionView.setCollectionViewLayout(layout, animated: false)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(ArtworkViewCell.self)
        myCollectionView.backgroundColor = .clear
        view.addSubview(myCollectionView)
       
        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myCollectionView.reloadData()
    }
    
    func initViewModel() {
        displayLoadingScreen()
        viewModel = ArtworkViewModel()
        setupViewModelBindings()
    }
    
    func setupViewModelBindings() {
        viewModel.artworkListResult.signal.observeValues { [weak self] _ in
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
        searchBar.searchBar.placeholder = L10n.searchAnArtwork
        searchBar.searchBar.delegate = self
        navigationItem.searchController = searchBar
        definesPresentationContext = true
    }
    
    func prepareOnPushToDetailsVC(artName: String) {
        let vc = ArtworkDetailViewController(artName: artName)
        navigationController?.pushViewController(vc, animated: true)
    }
}
