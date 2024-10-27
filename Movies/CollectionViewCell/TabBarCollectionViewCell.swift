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
        label.textColor = CustomColor.buttonColor
        return label
    }()
    
    private let tabItemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(systemName: Constants.Icons.home, withConfiguration: configuration)?.withRenderingMode(.alwaysTemplate)
        imageView.image = iconImage
        imageView.tintColor  = CustomColor.customSecondaryLabelColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let selectedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.tabBarBackgroundColor
        view.layer.cornerRadius = 30
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSelectedView()
        configureTabItemImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSelectedView() {
        contentView.addSubview(selectedView)
        
        selectedView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        selectedView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        selectedView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        selectedView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
    }
    
    private func configureTabItemImage() {
        contentView.addSubview(tabItemImage)
        
        tabItemImage.heightAnchor.constraint(equalToConstant: 27).isActive = true
        tabItemImage.widthAnchor.constraint(equalToConstant: 27).isActive = true
        tabItemImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tabItemImage.centerYAnchor.constraint(equalTo: selectedView.centerYAnchor).isActive = true
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
       
        let iconImage = UIImage(systemName: imageName)?.withRenderingMode(.alwaysTemplate)
        DispatchQueue.main.async {
            self.tabItemImage.image = iconImage
        }
    }
    
    func animateTabItem(isSelected: Bool) {
        switch isSelected {
        case true:
            setTabItemSelectAnimation()
        case false:
            setTabItemUnSelectAnimation()
        }
    }
    
    private func setTabItemSelectAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2,  options: .curveEaseInOut, animations: {
            self.selectedView.backgroundColor = CustomColor.buttonColor
            self.tabItemImage.alpha =  0.8
            self.tabItemImage.tintColor = CustomColor.buttonContentColor
            self.tabItemImage.transform = CGAffineTransform(scaleX: 1.06, y: 1.06)
        }, completion:{ _ in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                self.tabItemImage.alpha =  1
            })
        })
    }
    
    private func setTabItemUnSelectAnimation() {
        self.selectedView.backgroundColor = CustomColor.tabBarBackgroundColor
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2,  options: .curveEaseIn, animations: {
            self.tabItemImage.tintColor = CustomColor.customSecondaryLabelColor
            self.tabItemImage.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
}
