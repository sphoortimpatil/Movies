//
//  PersonalizedGreetingView.swift
//  Movies
//
//  Created by Sphoorti M Patil on 28/10/24.
//

import UIKit

protocol PersonalizedGreetingViewDelegate: AnyObject {
    func didTapSearchButton()
}

class PersonalizedGreetingView: UIView {
    weak var delegate: PersonalizedGreetingViewDelegate?
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
    private let userIdentityLabel: UILabel = createHeaderLabel(text: "User", fontSize: 28, textColor: CustomColor.customPurple ?? .black)
    
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Search")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAppImage()
        configureGreetingLabel()
        configureUserIdentityLabel()
        configureSearchIcon()
        addGesturesForSearchIcon()
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
    
    private func configureSearchIcon() {
        self.addSubview(searchIcon)
        
        searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        searchIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        searchIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        searchIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func addGesturesForSearchIcon() {
        searchIcon.isUserInteractionEnabled = true
        searchIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(searchIconTapped)))
    }
    
    @objc private func searchIconTapped() {
        delegate?.didTapSearchButton()
    }
}
