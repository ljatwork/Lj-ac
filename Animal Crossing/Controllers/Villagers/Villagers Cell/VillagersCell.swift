//
//  VillagersCell.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/20/20.
//

import UIKit
import Combine

class VillagersCell: UITableViewCell {
    var containerView = UIView()
    var villagerImageView = UIImageView()
    var villagerNameLabel = UILabel()
    var villagerDescription = UILabel()
    private var cancellable = Set<AnyCancellable>()
    
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
        setUpVillagerImage()
        setUpVillagerName()
        setUpVillagerDesc()
    }
    
    func setVillagerData(villager: VillagerElement) {
        villagerNameLabel.text = villager.name
        let personalityStr = villager.personality.rawValue.replacingOccurrences(of: "personality", with: "")
        villagerDescription.text = "\(villager.species.capitalized) / \(villager.gender.rawValue.capitalized) / \(personalityStr.capitalized)"
        villagerImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: villager.imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.villagerImageView.image = img
                    }
                }
            }
        }
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
            make.height.equalTo(90)
        }
    }
    
    func setUpVillagerImage() {
        villagerImageView.translatesAutoresizingMaskIntoConstraints = false
        villagerImageView.contentMode = .scaleAspectFit
        containerView.addSubview(villagerImageView)
        villagerImageView.snp.makeConstraints { make in
            make.centerY.equalTo(containerView)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(70)
        }
    }
    
    func setUpVillagerName() {
        villagerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        villagerNameLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 17)
        villagerNameLabel.textAlignment = .center
        containerView.addSubview(villagerNameLabel)
        villagerNameLabel.numberOfLines = 0
        villagerNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(villagerImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-80)
            make.height.equalTo(40)
        }
    }
    
    func setUpVillagerDesc() {
        villagerDescription.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(villagerDescription)
        villagerDescription.numberOfLines = 0
        villagerDescription.lineBreakMode = .byCharWrapping
        villagerDescription.font = ACUtils.defaultAppFont(fontSize: 17)
        villagerDescription.textAlignment = .center
        villagerDescription.snp.makeConstraints { make in
            make.top.equalTo(villagerNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(villagerImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-80)
            make.height.greaterThanOrEqualTo(20)
        }
    }
}
