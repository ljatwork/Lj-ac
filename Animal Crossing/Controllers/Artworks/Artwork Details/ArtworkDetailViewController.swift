//
//  ArtworkDetailViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import UIKit
import SnapKit
import ReactiveSwift
import ReactiveCocoa

class ArtworkDetailViewController: UIViewController {
    lazy var scrollView = UIScrollView()
    lazy var containerStackView = UIStackView()
    lazy var longDescriptionStackView = UIStackView()
    lazy var imageContainerView = UIView()
    lazy var fakeImageView = UIImageView()
    lazy var realImageView = UIImageView()
    lazy var fakeLabel = UILabel()
    lazy var realLabel = UILabel()
    var artwork: ArtworkElement!
    var artName: String = ""
    var viewModel: ArtworkViewModel!
    
    init(artName: String) {
        self.artName = artName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArtworkViewModelBinding()
    }
    
    override func loadView() {
        super.loadView()
        setupView()
    }
    
    func setupView() {
        setupNavView()
        setBackgroud()
        setupScrollView()
    }
    
    func setupScrollView() {
        title = artName
        navigationController?.setNavigationBarHidden(false, animated: true)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupArtworkViewModelBinding() {
        viewModel = ArtworkViewModel()
        viewModel.fetchSingleArtwork(artname: artName)
        viewModel.singleArtwork.signal.observeValues { [weak self] artwork in
            guard let self = `self` else {
                return
            }
            DispatchQueue.main.async {
                self.setupContainerViews()
            }
        }
    }
    
}
