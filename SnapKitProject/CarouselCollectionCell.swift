//
//  CarouselCollectionCell.swift
//  SnapKitProject
//
//  Created by Oleg Kirsanov on 01.04.2022.
//

import UIKit

class CarouselCollectionCell: UICollectionViewCell {
    static let identifier = "CarouselCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
