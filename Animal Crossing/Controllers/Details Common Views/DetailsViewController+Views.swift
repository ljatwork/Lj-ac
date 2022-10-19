//
//  DetailsViewController+Views.swift
//  Animal Crossing
//
//  Created by Leah Joy Ylaya on 11/26/20.
//

import Foundation
import UIKit
import ReactiveSwift

extension DetailsViewController {
    
    // - reusable to all detail types
    // - prepare according to its type
    func setupData() {
        displayLoadingScreen()
        switch detailType {
        case .bug:
            setupBugViewModelBinding()
            break
        case .fossil:
            break
        case .seaCreature:
            setupSeaCreatureViewModelBinding()
            break
        case .fish:
            setupFishViewModelBinding()
            break
        case .villager:
            setupVillagerViewModelBinding()
            break
        case .none:
            break
        }
    }
    
    func setupVillagerDetailsView(villager: VillagerValue) {
        let villagerDetailsView = VillagerDetailsView(villager: villager)
        villagerDetailsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(villagerDetailsView)
        scrollView.isScrollEnabled = true 
        villagerDetailsView.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.width.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    func setVillagerHeaderData(villager: VillagerValue) {
        headerView.detailTitleLabel.text = villager.name
        headerView.detailImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: villager.imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.headerView.detailImageView.image = img
                    }
                }
            }
        }
    }
    
    func setupVillagerViewModelBinding() {
        let viewModel = VillagersViewModel()
        viewModel.fetchSingleVillager(queryItems: queryItems)
        viewModel.singleVillager.signal.observeValues { [weak self] villager in
            guard let self = `self` else {
                return
            }
            DispatchQueue.main.async {
                self.setupVillagerDetailsView(villager: viewModel.singleVillager.value)
                self.setVillagerHeaderData(villager: viewModel.singleVillager.value)
            }
        }
    }
}

// Fish details
extension DetailsViewController {
    
    func setupFishDetailsView(fish: FishElement) {
        let fishDetailsView = FishDetailsView(fish: fish)
        fishDetailsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(fishDetailsView)
        fishDetailsView.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.width.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    func setFishHeaderData(fish: FishElement) {
        headerView.detailTitleLabel.text = fish.name
        headerView.detailImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: fish.imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.headerView.detailImageView.image = img
                    }
                }
            }
        }
    }
    
    func setupFishViewModelBinding() {
        let viewModel = FishViewModel()
        viewModel.fetchSingleFish(queryItems: queryItems)
        viewModel.singleFish.signal.observeValues { [weak self] fish in
            guard let self = `self` else {
                return
            }
            DispatchQueue.main.async {
                self.setupFishDetailsView(fish: viewModel.singleFish.value)
                self.setFishHeaderData(fish: viewModel.singleFish.value)
            }
        }
    }
}

// Bug details
extension DetailsViewController {
    
    func setupBugDetailsView(bug: BugElement) {
        let bugDetailsView = BugDetailsView(bug: bug)
        bugDetailsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(bugDetailsView)
        bugDetailsView.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.width.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    func setBugHeaderData(bug: BugElement) {
        headerView.detailTitleLabel.text = bug.name
        headerView.detailImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: bug.imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.headerView.detailImageView.image = img
                    }
                }
            }
        }
    }
    
    func setupBugViewModelBinding() {
        let viewModel = BugViewModel()
        viewModel.fetchSingleBug(queryItems: queryItems)
        viewModel.singleBug.signal.observeValues { [weak self] fish in
            guard let self = `self` else {
                return
            }
            DispatchQueue.main.async {
                self.setupBugDetailsView(bug: viewModel.singleBug.value)
                self.setBugHeaderData(bug: viewModel.singleBug.value)
            }
        }
    }
}

// sea creature details
extension DetailsViewController {
    
    func setupSeaCreatureDetailsView(seaCreature: SeaCreatureElement) {
        let seaCreatureDetailsView = SeaCreatureDetailView(seaCreature: seaCreature)
        seaCreatureDetailsView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(seaCreatureDetailsView)
        seaCreatureDetailsView.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.width.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    func setSeaCreatureHeaderData(seaCreature: SeaCreatureElement) {
        headerView.detailTitleLabel.text = seaCreature.name
        headerView.detailImageView.image = ImageCache.publicCache.placeholderImage
        if let url = URL(string: seaCreature.imageURL) {
            ImageCache.publicCache.load(url: url) { [weak self] (image) in
                DispatchQueue.main.async {
                    if let img = image {
                        self?.headerView.detailImageView.image = img
                    }
                }
            }
        }
    }
    
    func setupSeaCreatureViewModelBinding() {
        let viewModel = SeaCreatureViewModel()
        viewModel.fetchSingleSeaCreature(queryItems: queryItems)
        viewModel.singleSeaCreature.signal.observeValues { [weak self] fish in
            guard let self = `self` else {
                return
            }
            DispatchQueue.main.async {
                self.setupSeaCreatureDetailsView(seaCreature: viewModel.singleSeaCreature.value)
                self.setSeaCreatureHeaderData(seaCreature: viewModel.singleSeaCreature.value)
            }
        }
    }
}

