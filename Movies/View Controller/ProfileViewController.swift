//
//  ProfileViewController.swift
//  Movies
//
//  Created by Sphoorti M Patil on 25/10/24.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    private let searchBar = AppSearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        searchBar.setContentCompressionResistancePriority(.required, for: .vertical)

    }
}
