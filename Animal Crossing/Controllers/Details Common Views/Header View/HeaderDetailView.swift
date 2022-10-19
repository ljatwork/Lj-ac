//
//  HeaderDetailView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/26/20.
//

import Foundation
import UIKit
import SnapKit

class DetailHeaderView: UIView {
    lazy var containerView = UIView()
    lazy var detailTitleLabel = UILabel()
    lazy var detailImageView = UIImageView()
    lazy var backButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupButton()
        setupContainerView()
        setupLabelView()
        setupImageView()
    }
    
    func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor(hexString: ColorHex.hex3.rawValue)
        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupLabelView() {
        detailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        detailTitleLabel.text = ""
        detailTitleLabel.textColor = .white
        detailTitleLabel.textAlignment = .center
        containerView.addSubview(detailTitleLabel)
        detailTitleLabel.snp.makeConstraints { make in
            make.bottom.trailing.leading.equalToSuperview().inset(25)
            make.height.equalTo(25)
        }
    }
    
    func setupImageView() {
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.image = Asset.update.image
        detailImageView.contentMode = .scaleToFill
        containerView.addSubview(detailImageView)
        detailImageView.snp.makeConstraints { make in
            make.height.width.equalTo(80)
            make.bottom.equalTo(detailTitleLabel.snp.top).inset(-10)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupButton() {
        let backButtonImg = Asset.back.image.withRenderingMode(.alwaysTemplate)
        backButton.setImage(backButtonImg, for: .normal)
        backButton.imageView?.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.top.equalToSuperview().inset(32)
            make.leading.equalToSuperview().inset(10)
        }
    }
    
}
