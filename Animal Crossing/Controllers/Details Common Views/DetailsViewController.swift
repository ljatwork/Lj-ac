//
//  DetailsViewController.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/26/20.
//

import Foundation
import UIKit
import SnapKit
import ReactiveSwift

class DetailsViewController: UIViewController {
    lazy var scrollView = UIScrollView()
    lazy var headerView = DetailHeaderView()
    var detailType: DetailType!
    var queryItems = [URLQueryItem]()
    
    init(detailType: DetailType, queryItems: [URLQueryItem]) {
        self.detailType = detailType
        self.queryItems = queryItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    override func loadView() {
        super.loadView()
        setBackgroud()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupView() {
        setupScrollView()
        setupHeaderView()
    }
    
    func setupScrollView() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupHeaderView() {
        headerView = DetailHeaderView(frame: .zero)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerView)
        headerView.backButton.reactive.controlEvents(.touchUpInside).observe { [weak self] _ in
            guard let self = `self` else { return }
            self.dismissView()
        }
        headerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalToSuperview()
        }
    }
    
    func dismissView() {
        navigationController?.popViewController(animated: true)
    }
}
