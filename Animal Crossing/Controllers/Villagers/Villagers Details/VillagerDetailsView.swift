//
//  VillagerDetailsView.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/26/20.
//

import UIKit

class VillagerDetailsView: UIView {
    lazy var containerStackView = UIStackView()
    var villager: VillagerValue!
    
    init(villager: VillagerValue) {
        self.villager = villager
        super.init(frame: .zero)
        setupContainerStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupContainerStackView() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.distribution = .fillEqually
        containerStackView.spacing = 10
        addSubview(containerStackView)
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        addDetailsToView()
    }
    
    // - add all details to the stackview
    func addDetailsToView() {
        containerStackView.addArrangedSubview(setupSpeciesView())
        containerStackView.addArrangedSubview(setupPersonalityView())
        containerStackView.addArrangedSubview(setupGenderView())
        containerStackView.addArrangedSubview(setupBirthdayView())
        containerStackView.addArrangedSubview(setupSignView())
        containerStackView.addArrangedSubview(setupQuoteView())
        containerStackView.addArrangedSubview(setupPhraseView())
        containerStackView.addArrangedSubview(setupClothingView())
    }
    
    func setupClothingView() -> DetailsView {
        let clothingView = DetailsView(frame: .zero)
        clothingView.titleLabel.text = L10n.clothing
        clothingView.detailLabel.text = villager.clothing.capitalized
        return clothingView
    }
    
    func setupPhraseView() -> DetailsView {
        let phraseView = DetailsView(frame: .zero)
        phraseView.titleLabel.text = L10n.phrase
        phraseView.detailLabel.text = villager.phrase.capitalized
        return phraseView
    }
    
    func setupQuoteView() -> DetailsView {
        let quoteView = DetailsView(frame: .zero)
        quoteView.titleLabel.text = L10n.quote
        quoteView.detailLabel.text = villager.quote.capitalized
        return quoteView
    }
    
    func setupSignView() -> DetailsView {
        let signView = DetailsView(frame: .zero)
        signView.titleLabel.text = L10n.quote
        signView.detailLabel.text = villager.sign.rawValue.capitalized
        return signView
    }
    
    func setupBirthdayView() -> DetailsView {
        let birthdayView = DetailsView(frame: .zero)
        birthdayView.titleLabel.text = L10n.birthday
        let month = villager.birthdayMonth.rawValue.capitalized
        let day = villager.birthdayDay
        birthdayView.detailLabel.text = "\(month), \(day)"
        return birthdayView
    }
    
    func setupGenderView() -> DetailsView {
        let genderView = DetailsView(frame: .zero)
        genderView.titleLabel.text = L10n.gender
        genderView.detailLabel.text = villager.gender.rawValue.capitalized
        return genderView
    }
    
    func setupPersonalityView() -> DetailsView {
        let personalityView = DetailsView(frame: .zero)
        personalityView.titleLabel.text = L10n.personality
        let personalityStr = villager.personality.rawValue.replacingOccurrences(of: "personality", with: "")
        personalityView.detailLabel.text = personalityStr.capitalized
        return personalityView
        
    }
    
    func setupSpeciesView() -> DetailsView {
        let speciesView = DetailsView(frame: .zero)
        speciesView.titleLabel.text = L10n.species
        speciesView.detailLabel.text = villager.species
        return speciesView
    }
}
