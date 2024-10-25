//
//  TabBarCollectionViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 25/10/24.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {
    private let tabItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Home"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = CustomColor.customButtonColor
        return label
    }()
    
    private let tabItemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(pointSize: 10, weight: .light)
        let iconImage = UIImage(systemName: Constants.Icons.home, withConfiguration: configuration)?.withTintColor(CustomColor.customSecondaryLabelColor!, renderingMode: .alwaysOriginal)
        imageView.image = iconImage
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTabItemImage()
        configureTabItemLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTabItemImage() {
        contentView.addSubview(tabItemImage)
        
        tabItemImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tabItemImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        tabItemImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tabItemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20).isActive = true
    }
    
    private func configureTabItemLabel() {
        contentView.addSubview(tabItemLabel)
        
        tabItemLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tabItemLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        tabItemLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tabItemLabel.topAnchor.constraint(equalTo: tabItemImage.bottomAnchor, constant: 0).isActive = true
    }
    
    func setTabItems(label: String, imageName: String) {
        tabItemLabel.text = label
       
        let configuration = UIImage.SymbolConfiguration(pointSize: 10, weight: .light)
        let iconImage = UIImage(systemName: imageName, withConfiguration: configuration)?.withTintColor(CustomColor.customSecondaryLabelColor!, renderingMode: .alwaysOriginal)
        DispatchQueue.main.async {
            self.tabItemImage.image = iconImage
        }
    }
}
