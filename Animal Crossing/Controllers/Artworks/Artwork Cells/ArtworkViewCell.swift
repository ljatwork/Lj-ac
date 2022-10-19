//
//  ArtworkViewCell.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import UIKit

extension ArtworkViewCell: ReusableView {}

class ArtworkViewCell: UICollectionViewCell {
    lazy var containerView = UIView()
    lazy var artworkOGImage = UIImageView()
    lazy var artworkLabel = UILabel()
    
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
        artworkOGImage.translatesAutoresizingMaskIntoConstraints = false
        artworkOGImage.contentMode = .scaleAspectFit
        containerView.addSubview(artworkOGImage)
        artworkOGImage.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
        }
    }
    
    func setupLabel() {
        artworkLabel.translatesAutoresizingMaskIntoConstraints = false
        artworkLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        artworkLabel.textAlignment = .center
        artworkLabel.numberOfLines = 0
        artworkLabel.lineBreakMode = .byWordWrapping
        containerView.addSubview(artworkLabel)
        artworkLabel.snp.makeConstraints { make in
            make.top.equalTo(artworkOGImage.snp.bottom)
            make.bottom.trailing.leading.equalToSuperview().inset(10)
            make.height.equalTo(18)
        }
    }
    
    func setartworkOGImage(_ imageURL: String) {
        artworkOGImage.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.artworkOGImage.image = img
                    }
                }
            }
        }
    }
}
