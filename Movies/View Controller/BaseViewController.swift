//
//  CustomBackgroundColorViewController.swift
//  Movies
//
//  Created by Sphoorti M Patil on 28/10/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    let baseView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = CustomColor.backgroundColor
        setUpBaseView()
    }
    
    private func setUpBaseView() {
        view.addSubview(baseView)
        baseView.translatesAutoresizingMaskIntoConstraints = false
        
        baseView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        baseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        navigationController?.navigationBar.isHidden = true
    }

}
