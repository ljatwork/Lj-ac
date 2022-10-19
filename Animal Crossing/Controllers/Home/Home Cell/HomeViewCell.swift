//
//  HomeViewCell.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/19/20.
//

import UIKit

class HomeViewCell: UITableViewCell {
    var itemImageView = UIImageView()
    var cellImage: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.cornerRadius = 10
        setupItemsView()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupItemsView() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.backgroundColor = .clear
        addSubview(itemImageView)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        itemImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setImage(imageStr :String) {
        itemImageView.image = UIImage(named: "\(imageStr).png")
        cellImage = UIImage(named: "\(imageStr).png")
    }
}

class HomeCollectionCell: UICollectionViewCell {
    var itemImageView = UIImageView()
    var cellType: Menu = .friends
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupItemsView()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupItemsView() {
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.backgroundColor = .clear
        addSubview(itemImageView)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        itemImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setImage(imageStr :String) {
        itemImageView.image = UIImage(named: "\(imageStr).png")
        cellType = Menu(rawValue: imageStr) ?? .friends
    }
}
