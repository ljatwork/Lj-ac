//
//  CrittersMenuViewCell.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/3/20.
//

import UIKit

extension CrittersMenuViewCell: ReusableView {}

class CrittersMenuViewCell: UITableViewCell {
    var containerView = UIView()
    var critterImageView = UIImageView()
    var critterLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView() {
        setupContainerView()
        setUpCritterImage()
        setUpCritterLabel()
    }
    
    func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.contentMode = .scaleAspectFit
        containerView.backgroundColor = .clear
        addSubview(containerView)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().offset(10)
            make.height.equalTo(170)
        }
    }
    
    func setUpCritterImage() {
        critterImageView.translatesAutoresizingMaskIntoConstraints = false
        critterImageView.contentMode = .scaleAspectFit
        containerView.addSubview(critterImageView)
        critterImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(150)
        }
    }
    
    func setUpCritterLabel() {
        critterLabel.translatesAutoresizingMaskIntoConstraints = false
        critterLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 20)
        critterLabel.textAlignment = .center
        containerView.addSubview(critterLabel)
        critterLabel.numberOfLines = 0
        critterLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(critterImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(80)
        }
    }
}
