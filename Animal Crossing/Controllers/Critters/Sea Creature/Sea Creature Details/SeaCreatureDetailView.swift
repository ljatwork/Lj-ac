//
//  SeaCreatureDetailView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import UIKit

class SeaCreatureDetailView: UIView {
    lazy var containerStackView = UIStackView()
    lazy var catchPhraseContainerView = UIView()
    lazy var northHemisphereContainerView = UIView()
    lazy var northHemisphereLabel = UILabel()
    lazy var southHemisphereContainerView = UIView()
    lazy var southHemisphereLabel = UILabel()
    
    var seaCreature: SeaCreatureElement!
    
    init(seaCreature: SeaCreatureElement) {
        self.seaCreature = seaCreature
        super.init(frame: .zero)
        setupContainerViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContainerViews() {
        setupContainerStackView()
        setupCatchPhraseContainerView()
        setupNorthHemContainerView()
        setupSouthHemContainerView()
    }
    
    func setupContainerStackView() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.distribution = .fillEqually
        containerStackView.spacing = 10
        addSubview(containerStackView)
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        addDetailsToView()
    }
    
    func setupCatchPhraseContainerView() {
        catchPhraseContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(catchPhraseContainerView)
        setupCatchPhraseContentView()
        catchPhraseContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(containerStackView.snp.bottom).offset(10)
            make.height.greaterThanOrEqualTo(20)
        }
    }
    
    // - add all details to the stackview
    func addDetailsToView() {
        containerStackView.addArrangedSubview(setupShadowSizeView())
        containerStackView.addArrangedSubview(setupShadowMovementView())
        containerStackView.addArrangedSubview(setupRarityView())
        containerStackView.addArrangedSubview(setupNookPriceView())
        containerStackView.addArrangedSubview(setupTankSizeView())
    }
    
    func setupShadowSizeView() -> ElementsView {
        let shadowSizeView = ElementsView(frame: .zero)
        shadowSizeView.titleLabel.text = L10n.shadowSize
        shadowSizeView.detailLabel.text = seaCreature.shadowSize.capitalized
        return shadowSizeView
    }
    
    func setupShadowMovementView() -> ElementsView {
        let shadowMovementView = ElementsView(frame: .zero)
        shadowMovementView.titleLabel.text = L10n.shadowMovement
        shadowMovementView.detailLabel.text = seaCreature.shadowMovement.capitalized
        return shadowMovementView
    }
    
    func setupRarityView() -> ElementsView {
        let rarityView = ElementsView(frame: .zero)
        rarityView.titleLabel.text = L10n.rarity
        rarityView.detailLabel.text = seaCreature.rarity.rawValue.capitalized
        return rarityView
    }
    
    func setupNookPriceView() -> ElementsView {
        let rarityView = ElementsView(frame: .zero)
        rarityView.titleLabel.text = L10n.nookPrice
        rarityView.detailLabel.text = "\(seaCreature.nookPrice.description) \(L10n.bells)"
        return rarityView
    }
    
    func setupTankSizeView() -> ElementsView {
        let rarityView = ElementsView(frame: .zero)
        rarityView.titleLabel.text = L10n.tankSize
        rarityView.detailLabel.text = "\(seaCreature.tankWidth) x \(seaCreature.tankLength)"
        return rarityView
    }
    
    func setupCatchPhraseContentView() {
        let catchphraseView = ElementsView(frame: .zero)
        catchphraseView.titleLabel.text = L10n.catchphrase
        var catchphrases = ""
        for catchphrase in seaCreature.catchphrases {
            catchphrases.append(catchphrase)
        }
        catchphraseView.detailLabel.text = catchphrases
        catchphraseView.translatesAutoresizingMaskIntoConstraints = false
        catchPhraseContainerView.addSubview(catchphraseView)
        catchphraseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// north hemisphere view
extension SeaCreatureDetailView {
    func setupNorthHemContainerView() {
        northHemisphereContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(northHemisphereContainerView)
        setupNorthHemLabel()
        setupNorthAvailabilityView()
        northHemisphereContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(catchPhraseContainerView.snp.bottom)
        }
        
    }
    
    func setupNorthHemLabel() {
        northHemisphereLabel.translatesAutoresizingMaskIntoConstraints = false
        northHemisphereLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        northHemisphereLabel.numberOfLines = 0
        northHemisphereLabel.lineBreakMode = .byWordWrapping
        northHemisphereLabel.text = L10n.northHemisphere
        northHemisphereContainerView.addSubview(northHemisphereLabel)
        northHemisphereLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
    }
    
    func setupNorthAvailabilityView() {
        let availabilityView = ElementsView(frame: .zero)
        availabilityView.titleLabel.text = L10n.availability
        var availabilities = ""
        for item in seaCreature.north.availabilityArray {
            availabilities.append("\(item.months) : \(item.time ?? ""); ")
        }
        availabilityView.detailLabel.text = availabilities
        availabilityView.translatesAutoresizingMaskIntoConstraints = false
        northHemisphereContainerView.addSubview(availabilityView)
        availabilityView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(northHemisphereLabel.snp.bottom)
        }
    }
    
}

// south hemisphere view
extension SeaCreatureDetailView {
    func setupSouthHemContainerView() {
        southHemisphereContainerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(southHemisphereContainerView)
        setupSouthHemLabel()
        setupSouthAvailabilityView()
        southHemisphereContainerView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.top.equalTo(northHemisphereContainerView.snp.bottom)
        }
        
    }
    
    func setupSouthHemLabel() {
        southHemisphereLabel.translatesAutoresizingMaskIntoConstraints = false
        southHemisphereLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 14)
        southHemisphereLabel.numberOfLines = 0
        southHemisphereLabel.lineBreakMode = .byWordWrapping
        southHemisphereLabel.text = L10n.southHemisphere
        southHemisphereContainerView.addSubview(southHemisphereLabel)
        southHemisphereLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
    }
    
    func setupSouthAvailabilityView()  {
        let availabilityView = ElementsView(frame: .zero)
        availabilityView.titleLabel.text = L10n.availability
        var availabilities = ""
        for item in seaCreature.south.availabilityArray {
            availabilities.append("\(item.months) : \(item.time ?? ""); ")
        }
        availabilityView.detailLabel.text = availabilities
        availabilityView.translatesAutoresizingMaskIntoConstraints = false
        southHemisphereContainerView.addSubview(availabilityView)
        availabilityView.snp.makeConstraints { make in
            make.bottom.trailing.bottom.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.top.equalTo(southHemisphereLabel.snp.bottom)
        }
    }
    
}
