//
//  CarouselCollectionCell.swift
//  SnapKitProject
//
//  Created by Oleg Kirsanov on 01.04.2022.
//

import UIKit
import SnapKit

class CarouselCollectionCell: UICollectionViewCell {
    static let identifier = "CarouselCollectionCell"
    
    private lazy var carouselView: CarouselView = {
        let frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        let carouselView = CarouselView(frame: frame)
        contentView.addSubview(carouselView)
        carouselView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        return carouselView
    }()
    
    var cellModel: CellModel? {
        didSet {
            carouselView.model = cellModel?.model
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct CellModel {
        var title: String?
        var description: String?
        var liked: Bool?
        var model: CarouselView.CarouselModel?
    }
    
    override func prepareForReuse() {
        cellModel = nil
    }
    
}
