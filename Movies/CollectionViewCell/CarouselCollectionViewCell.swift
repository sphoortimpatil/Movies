//
//  CarouselCollectionViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 28/10/24.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    private let carouselImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(named: "MovieImage")
        imageView.image = iconImage
        imageView.tintColor  = CustomColor.secondaryLabelColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true
       
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCarouselImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCarouselImage() {
        contentView.addSubview(carouselImage)
        
        carouselImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        carouselImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        carouselImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        carouselImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        carouselImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
}
