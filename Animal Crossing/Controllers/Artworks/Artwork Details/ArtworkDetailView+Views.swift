//
//  ArtworkDetailViewController+Views.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 12/11/20.
//

import Foundation
import UIKit
import SnapKit

extension ArtworkDetailViewController {
    func setupContainerViews() {
        setupContainerStackView()
        setupLongDescContainerStackView()
        setupImageContainerView()
    }
    
    func setupContainerStackView() {
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .vertical
        containerStackView.distribution = .fillEqually
        containerStackView.spacing = 10
        scrollView.addSubview(containerStackView)
        containerStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        addDetailsToView()
    }
    
    // - add all details to the stackview
    func addDetailsToView() {
        containerStackView.addArrangedSubview(setupHasFakeView())
        containerStackView.addArrangedSubview(setupArtNameView())
        containerStackView.addArrangedSubview(setupAuthorView())
        containerStackView.addArrangedSubview(setupYearView())
        containerStackView.addArrangedSubview(setupArtStyleView())
        containerStackView.addArrangedSubview(setupBuyView())
        containerStackView.addArrangedSubview(setupNookPriceView())
        containerStackView.addArrangedSubview(setupSizeView())
    }
    
    func setupSizeView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.artSize
        view.detailLabel.text = "\(viewModel.singleArtwork.value.length) x \(viewModel.singleArtwork.value.width)"
        return view
    }
    
    func setupNookPriceView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.nookPrice
        view.detailLabel.text = viewModel.singleArtwork.value.sell.description.capitalized
        return view
    }
    
    func setupBuyView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.buy
        view.detailLabel.text = viewModel.singleArtwork.value.buy.description.capitalized
        return view
    }
    
    func setupArtStyleView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.artStyle
        view.detailLabel.text = viewModel.singleArtwork.value.artStyle.capitalized
        return view
    }
    
    func setupYearView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.year
        view.detailLabel.text = viewModel.singleArtwork.value.year.capitalized
        return view
    }
    
    func setupAuthorView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.author
        view.detailLabel.text = viewModel.singleArtwork.value.author.capitalized
        return view
    }
    
    func setupArtNameView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.artName
        view.detailLabel.text = viewModel.singleArtwork.value.artName.capitalized
        return view
    }
    
    func setupHasFakeView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.hasFake
        view.detailLabel.text = viewModel.singleArtwork.value.hasFake.description.capitalized
        return view
    }
}

// imaages
extension ArtworkDetailViewController {
    
    func setupLongDescContainerStackView() {
        longDescriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        longDescriptionStackView.axis = .vertical
        longDescriptionStackView.distribution = .fillEqually
        longDescriptionStackView.spacing = 10
        addDescToStackView()
        scrollView.addSubview(longDescriptionStackView)
        longDescriptionStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(containerStackView.snp.bottom)
        }
    }
    
    func addDescToStackView() {
        longDescriptionStackView.addArrangedSubview(setupArtDescView())
        longDescriptionStackView.addArrangedSubview(setupAuthenticityView())
    }
    
    func setupArtDescView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.artworkDescription
        view.detailLabel.text = viewModel.singleArtwork.value.artworkDescription.capitalized
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func setupAuthenticityView() -> ElementsView {
        let view = ElementsView(frame: .zero)
        view.titleLabel.text = L10n.authenticity
        view.detailLabel.text = viewModel.singleArtwork.value.authenticity.description.capitalized
        return view
    }
}

extension ArtworkDetailViewController {
    func setupImageContainerView() {
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imageContainerView)
        setupOGLabel()
        setupFakeLabel()
        setupOGImageView()
        setupFakeImageView()
        imageContainerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(longDescriptionStackView.snp.bottom)
            make.height.equalToSuperview()
        }
    }
    
    func setupOGLabel() {
        realLabel.translatesAutoresizingMaskIntoConstraints = false
        realLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 15)
        realLabel.textAlignment = .center
        realLabel.numberOfLines = 0
        realLabel.lineBreakMode = .byWordWrapping
        realLabel.text = L10n.realArt
        imageContainerView.addSubview(realLabel)
        realLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.height.equalTo(20)
            make.width.equalTo((Constants.SCREEN_WIDTH - 10) / 2)
        }
    }
    
    func setupFakeLabel() {
        fakeLabel.translatesAutoresizingMaskIntoConstraints = false
        fakeLabel.font = ACUtils.defaultAppFont(weight: .bold, fontSize: 15)
        fakeLabel.textAlignment = .center
        fakeLabel.numberOfLines = 0
        fakeLabel.lineBreakMode = .byWordWrapping
        fakeLabel.text = L10n.fakeArt
        imageContainerView.addSubview(fakeLabel)
        fakeLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().offset(10)
            make.leading.equalTo(realLabel.snp.trailing)
            make.height.equalTo(20)
        }
    }
    
    func setupOGImageView() {
        realImageView.translatesAutoresizingMaskIntoConstraints = false
        realImageView.contentMode = .scaleAspectFit
        imageContainerView.addSubview(realImageView)
        setOGImage()
        realImageView.snp.makeConstraints { make in
            make.top.equalTo(realLabel.snp.bottom)
            make.leading.bottom.equalToSuperview().offset(10)
            make.width.equalTo((Constants.SCREEN_WIDTH - 10) / 2)
        }
    }
    
    func setupFakeImageView() {
        fakeImageView.translatesAutoresizingMaskIntoConstraints = false
        fakeImageView.contentMode = .scaleAspectFit
        imageContainerView.addSubview(fakeImageView)
        setFakeImage()
        fakeImageView.snp.makeConstraints { make in
            make.top.equalTo(fakeLabel.snp.bottom)
            make.leading.equalTo(realImageView.snp.trailing)
            make.bottom.trailing.equalToSuperview().offset(10)
        }
    }
    
    func setOGImage() {
        realImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: viewModel.singleArtwork.value.imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.realImageView.image = img
                    }
                }
            }
        }
    }
    
    func setFakeImage() {
        fakeImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: viewModel.singleArtwork.value.fakeImageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.fakeImageView.image = img
                    }
                }
            }
        }
    }
}

