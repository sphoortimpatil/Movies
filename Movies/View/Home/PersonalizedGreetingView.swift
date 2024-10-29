//
//  PersonalizedGreetingView.swift
//  Movies
//
//  Created by Sphoorti M Patil on 28/10/24.
//

import UIKit

class PersonalizedGreetingView: UIView {

    private let appImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(named: "ThemedAppIcon")
        imageView.image = iconImage
        imageView.tintColor  = CustomColor.secondaryLabelColor
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let greetingLabel: UILabel = createHeaderLabel(text: "Hello,", fontSize: 28, textColor: CustomColor.primaryLabelColor ?? .black)
    private let userIdentityLabel: UILabel = createHeaderLabel(text: "User", fontSize: 28, textColor: CustomColor.titleLabelColor ?? .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppImage()
        configureGreetingLabel()
        configureUserIdentityLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppImage() {
        self.addSubview(appImage)
        
        appImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        appImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        appImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        appImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    private func configureGreetingLabel() {
        self.addSubview(greetingLabel)
        
        greetingLabel.centerYAnchor.constraint(equalTo: appImage.centerYAnchor).isActive = true
        greetingLabel.leadingAnchor.constraint(equalTo: appImage.trailingAnchor, constant: 10).isActive = true
    }
    
    private func  configureUserIdentityLabel() {
        self.addSubview(userIdentityLabel)
        
        userIdentityLabel.centerYAnchor.constraint(equalTo: appImage.centerYAnchor).isActive = true
        userIdentityLabel.leadingAnchor.constraint(equalTo: greetingLabel.trailingAnchor, constant: 5).isActive = true
    }
}
