//
//  HomeViewController..swift
//  Movies
//
//  Created by Sphoorti M Patil on 24/10/24.
//

import UIKit

class HomeViewController: CustomBackgroundColorViewController {
    private let appImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(named: "ThemedAppIcon")
        imageView.image = iconImage
        imageView.tintColor  = CustomColor.customSecondaryLabelColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppImage()

    }
    
    private func configureAppImage() {
        view.addSubview(appImage)
        
        appImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        appImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

