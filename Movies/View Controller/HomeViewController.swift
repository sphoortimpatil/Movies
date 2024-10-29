//
//  HomeViewController..swift
//  Movies
//
//  Created by Sphoorti M Patil on 24/10/24.
//

import UIKit

class HomeViewController: BaseViewController {
    private let personalizedGreetingView = PersonalizedGreetingView()
    private let homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTransparentTableViewCell.self, forCellReuseIdentifier: "TransparentCell")
        tableView.register(HomeCarouselTableViewCell.self, forCellReuseIdentifier: "CarouselCell")
        tableView.register(MovieOptionTableViewCell.self, forCellReuseIdentifier: "MovieOptionCell")
        tableView.register(MovieCardTableViewCell.self, forCellReuseIdentifier: "MovieCardCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderHeight = 6
        tableView.sectionFooterHeight = 6
        tableView.backgroundColor = CustomColor.backgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
    var alphaValue = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePersonalizedGreetingView()
        configureHomeTableView()
    }
    
    private func configurePersonalizedGreetingView() {
        baseView.addSubview(personalizedGreetingView)
        personalizedGreetingView.translatesAutoresizingMaskIntoConstraints = false
        
        personalizedGreetingView.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        personalizedGreetingView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10).isActive = true
        personalizedGreetingView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        personalizedGreetingView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
    }
    
    private func configureHomeTableView() {
        baseView.addSubview(homeTableView)
        
        homeTableView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 0).isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        baseView.bringSubviewToFront(personalizedGreetingView)
    }

}

extension HomeViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let personalizedGreetingViewFrame = personalizedGreetingView.frame
        let isMovingUp = personalizedGreetingViewFrame.maxY - 12  <= scrollView.contentOffset.y
    
        alphaValue = isMovingUp ? max(alphaValue - 0.05, 0) : min(alphaValue + 0.2, 1)
        personalizedGreetingView.alpha = alphaValue
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "TransparentCell", for: indexPath) as? HomeTransparentTableViewCell else { return UITableViewCell(frame: .zero) }
            cell.backgroundColor = .clear
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as? HomeCarouselTableViewCell else { return UITableViewCell(frame: .zero) }
            return cell
        case 2:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "MovieOptionCell", for: indexPath) as? MovieOptionTableViewCell else { return UITableViewCell(frame: .zero) }
            return cell
        case 3:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "MovieCardCell", for: indexPath) as? MovieCardTableViewCell else { return UITableViewCell(frame: .zero) }
            return cell
        default:
            return UITableViewCell(frame: .zero)
        }
    }
}
