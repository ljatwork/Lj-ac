//
//  CrittersViewCell.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/7/20.
//

import UIKit
import SnapKit

extension CrittersViewCell: ReusableView {}
class CrittersViewCell: UICollectionViewCell {
    lazy var containerView = UIView()
    lazy var critterImage = UIImageView()
    lazy var critterLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupContainer()
        setupImageView()
        setupLabel()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContainer() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerView)
        let count = Int.random(in: 0..<(ColorHex.allCases.count - 1))
        containerView.backgroundColor = UIColor(hexString: ColorHex.allCases[count].rawValue)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.layer.cornerRadius = 15
        
    }
    
    func setupImageView() {
        critterImage.translatesAutoresizingMaskIntoConstraints = false
        critterImage.contentMode = .scaleAspectFit
        containerView.addSubview(critterImage)
        critterImage.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    func setupLabel() {
        critterLabel.translatesAutoresizingMaskIntoConstraints = false
        critterLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        critterLabel.textAlignment = .center
        critterLabel.numberOfLines = 0
        critterLabel.lineBreakMode = .byWordWrapping
        containerView.addSubview(critterLabel)
        critterLabel.snp.makeConstraints { make in
            make.top.equalTo(critterImage.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    func setCritterImage(_ imageURL: String) {
        critterImage.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.critterImage.image = img
                    }
                }
            }
        }
    }
}
