//
//  HomeViewModel.swift
//  SnapKitProject
//
//  Created by Oleg Kirsanov on 01.04.2022.
//

import Foundation
import UIKit

class HomeViewModel {
    
    private let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    private let titles = ["Nature", "Beaches", "Outdoor", "Playground", "Fun"]
    
    // MARK: - CollectionView Datasource
    func NumberOfRows() -> Int {
        return 20
    }
    
    func modelFor(row: Int) -> CarouselCollectionCell.CellModel{
        let randomImages = imageNames.random(3)
        let title = titles.randomElement()
        let isLiked = [true, false].randomElement() ?? false
        let carouselModel = CarouselView.CarouselModel(images: randomImages)
        let model = CarouselCollectionCell.CellModel(title: title, description: "Demo description", liked: isLiked, model: carouselModel)
        return model
    }
}

extension Collection {
    func choose(from numberOfElements: Int) -> ArraySlice<Element> {
        return shuffled().prefix(numberOfElements)
    }
    
    func random (_ n: Int) -> [UIImage] {
        let names = choose(from: n)
        let images = names.compactMap { UIImage(named: $0 as? String ?? "1") }
        return images
    }
}
