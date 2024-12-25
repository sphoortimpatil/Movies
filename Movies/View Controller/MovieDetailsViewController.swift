//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Sphoorti Patil on 23/12/24.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    private let headerView = MovieDetailsHeaderView()
    private let movieDetailsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = CustomColor.primaryLabelColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 0).isActive = true
        headerView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10).isActive = true
        headerView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
