//
//  HomeViewController..swift
//  Movies
//
//  Created by Sphoorti M Patil on 24/10/24.
//

import UIKit

class HomeViewController: BaseViewController {
    private var isSearchBarExpanded = false {
        didSet {
            updateTableViewConstraints()
        }
    }
    private let personalizedGreetingView = PersonalizedGreetingView()
    private let searchBar = AppSearchBar()
    private let homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTransparentTableViewCell.self, forCellReuseIdentifier: "TransparentCell")
        tableView.register(HomeCarouselTableViewCell.self, forCellReuseIdentifier: "CarouselCell")
        tableView.register(MovieFilterTabWidgetsTableViewCell.self, forCellReuseIdentifier: "MovieOptionCell")
        tableView.register(MovieCardTableViewCell.self, forCellReuseIdentifier: "MovieCardCell")
        tableView.register(MovieListDataTableViewCell.self, forCellReuseIdentifier: "MovieListDataCell")
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderHeight = 6
        tableView.sectionFooterHeight = 6
        tableView.estimatedRowHeight = 44
        tableView.backgroundColor = CustomColor.backgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
    var alphaValue = 1.0
    private var tableViewTopToGreetingConstraint: NSLayoutConstraint!
    private var tableViewTopToSearchBarConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePersonalizedGreetingView()
        configureHomeTableView()
        setUpDelegates()
        configureSearchBar()
    }
    
    private func configurePersonalizedGreetingView() {
        baseView.addSubview(personalizedGreetingView)
        personalizedGreetingView.translatesAutoresizingMaskIntoConstraints = false
        
        personalizedGreetingView.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        personalizedGreetingView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10).isActive = true
        personalizedGreetingView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        personalizedGreetingView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureHomeTableView() {
        baseView.addSubview(homeTableView)
        
        tableViewTopToGreetingConstraint = homeTableView.topAnchor.constraint(equalTo: baseView.topAnchor)
        tableViewTopToSearchBarConstraint = homeTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor)
        tableViewTopToSearchBarConstraint.isActive = false
        
        tableViewTopToGreetingConstraint.isActive = true
        homeTableView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        homeTableView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        homeTableView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10).isActive = true
        
        baseView.bringSubviewToFront(personalizedGreetingView)
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        searchBar.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 16).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -16).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        searchBar.setContentCompressionResistancePriority(.required, for: .vertical)
        searchBar.isHidden = true
        searchBar.transform = CGAffineTransform(scaleX: 0.01, y: 1.0)
    }
    
    private func updateTableViewConstraints() {
        if isSearchBarExpanded {
            tableViewTopToGreetingConstraint.isActive = false
            tableViewTopToSearchBarConstraint.isActive = true
        } else {
            tableViewTopToSearchBarConstraint.isActive = false
            tableViewTopToGreetingConstraint.isActive = true
        }
        self.homeTableView.alpha = 0
        self.homeTableView.reloadData()
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            self.homeTableView.alpha = 1
        }
    }
    
    private func setUpDelegates() {
        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        personalizedGreetingView.delegate = self
        searchBar.delegate = self
    }
}

extension HomeViewController: PersonalizedGreetingViewDelegate {
    func didTapSearchButton() {
        print("Search tapped, delegated to homeVC")
        showSearchBarAnimation()
    }
    
    func showSearchBarAnimation() {
        searchBar.isHidden = false
        searchBar.transform = CGAffineTransform(scaleX: 0.01, y: 1.0)
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.personalizedGreetingView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                self.personalizedGreetingView.alpha = 0.0
                self.searchBar.transform = .identity
            },
            completion: { _ in
                self.personalizedGreetingView.isHidden = true
                self.personalizedGreetingView.transform = .identity
                self.isSearchBarExpanded = true
            }
        )
    }
}

extension HomeViewController: AppSearchBarDelegate {
    func didTapClose() {
        print("Search Close, delegated to homeVC")
        hideSearchBarAnimation()
    }
    
    
    func hideSearchBarAnimation() {
        self.personalizedGreetingView.isHidden = false
        self.personalizedGreetingView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut,
            animations: {
                self.searchBar.transform = CGAffineTransform(scaleX: 0.01, y: 1.0)
                self.personalizedGreetingView.transform = .identity
                self.personalizedGreetingView.alpha = 1.0
            },
            completion: { _ in
                self.searchBar.isHidden = true
                self.searchBar.transform = .identity
                self.isSearchBarExpanded = false
            }
        )
    }
}

extension HomeViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        alphaValue = max(1 - (offsetY / 50), 0)
        personalizedGreetingView.alpha = alphaValue
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isSearchBarExpanded {
            let movieDetailVC = MovieDetailsViewController()
            navigationController?.pushViewController(movieDetailVC, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return isSearchBarExpanded ? 1 : 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchBarExpanded ? 10 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearchBarExpanded {
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "MovieListDataCell", for: indexPath) as? MovieListDataTableViewCell else { return UITableViewCell(frame: .zero) }
            cell.selectionStyle = .none
            return cell
        }else {
            switch indexPath.section {
                case 0:
                    guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "TransparentCell", for: indexPath) as? HomeTransparentTableViewCell else { return UITableViewCell(frame: .zero) }
                    cell.backgroundColor = .clear
                    cell.selectionStyle = .none
                    return cell
                case 1:
                    guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "CarouselCell", for: indexPath) as? HomeCarouselTableViewCell else { return UITableViewCell(frame: .zero) }
                    cell.selectionStyle = .none
                    return cell
                case 2:
                    guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "MovieOptionCell", for: indexPath) as? MovieFilterTabWidgetsTableViewCell else { return UITableViewCell(frame: .zero) }
                    cell.selectionStyle = .none
                    return cell
                case 3:
                    guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "MovieCardCell", for: indexPath) as? MovieCardTableViewCell else { return UITableViewCell(frame: .zero) }
                    cell.selectionStyle = .none
                    return cell
                default:
                    return UITableViewCell(frame: .zero)
            }
        }
    }
}
