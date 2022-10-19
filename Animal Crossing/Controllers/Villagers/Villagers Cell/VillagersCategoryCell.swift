//
//  VillagersCategoryCell.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import UIKit

class VillagersCategoryCell: UICollectionViewCell {
    var itemView = UIView()
    var itemLabel = UILabel()
    var cellType: Species = .Alligator
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupItemsView()
        setupLabel()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupItemsView() {
        itemView.translatesAutoresizingMaskIntoConstraints = false
        itemView.contentMode = .scaleAspectFit
        let count = Int.random(in: 0..<(ColorHex.allCases.count - 1))
        itemView.backgroundColor = UIColor(hexString: ColorHex.allCases[count].rawValue)
        itemView.layer.cornerRadius = 15
        addSubview(itemView)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        itemView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupLabel() {
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemView.addSubview(itemLabel)
        itemLabel.textAlignment = .center
        
        itemLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    func setLabel(_ label: String) {
        itemLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 25)
        itemLabel.textColor = .white
        itemLabel.text = label
    }
    
}
