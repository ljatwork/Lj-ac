//
//  ElementsView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/9/20.
//

import UIKit

class ElementsView: UIView {
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
        setupTitleView()
        setupDetailView()
    }
    
    func setupTitleView() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.width.greaterThanOrEqualTo(100)
        }
    }
    
    func setupDetailView() {
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.font = ACUtils.defaultAppFont(fontSize: 14)
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(10)
        }
    }

}
