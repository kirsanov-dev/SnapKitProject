//
//  CarouselView.swift
//  SnapKitProject
//
//  Created by Oleg Kirsanov on 02.04.2022.
//

import UIKit
import SnapKit

class CarouselView: UIView {

    private lazy var imageViewOne: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview().offset(-(frame.width / 2) - 20)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewTwo: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.left.equalTo(imageViewOne.snp.right).offset(1)
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalToSuperview().offset(-(frame.height/2) - 1)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewThree: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.left.equalTo(imageViewOne.snp.right).offset(1)
            $0.right.equalToSuperview()
            $0.top.equalTo(imageViewTwo.snp.bottom).offset(1)
            $0.bottom.equalToSuperview()
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViews = [imageViewOne, imageViewTwo, imageViewThree]
    
    var model: CarouselModel? {
        didSet {
            if let model = model {
                setupView(with: model)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(with model: CarouselModel) {
        for (index, view) in imageViews.enumerated() {
            let hasAnotherImage = model.images.count > index
            if hasAnotherImage {
                view.image = model.images[index]
            }
        }
    }
    
    struct CarouselModel {
        var images: [UIImage]
    }
}
