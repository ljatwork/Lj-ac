//
//  DetailsView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/26/20.
//

import UIKit
import SnapKit

class DetailsView: UIView {
    lazy var stackView = UIStackView()
    lazy var titleLabel = UILabel()
    lazy var detailLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareViews() {
        setupStackView()
        setupTitleLabel()
        setupDetailLabel()
        addSubviewtoStack()
    }
    
    func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addSubviewtoStack() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
    }
    
    func setupTitleLabel() {
        titleLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        titleLabel.textAlignment = .right
    }
    
    func setupDetailLabel() {
        detailLabel.font = ACUtils.defaultAppFont(fontSize: 14)
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        detailLabel.textAlignment = .left
    }

 

}
