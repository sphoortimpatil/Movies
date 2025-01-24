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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.sectionHeaderHeight = 6
        tableView.sectionFooterHeight = 6
        tableView.backgroundColor = CustomColor.backgroundColor
        tableView.separatorStyle = .none
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
        configureMovieDetailsTableView()
        setUpDelegates()
        registerTableViewCells()
    }
    
    private func configureHeaderView() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10).isActive = true
        headerView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureMovieDetailsTableView() {
        view.addSubview(movieDetailsTableView)
        
        movieDetailsTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10).isActive = true
        movieDetailsTableView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        movieDetailsTableView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        movieDetailsTableView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setUpDelegates() {
        movieDetailsTableView.delegate = self
        movieDetailsTableView.dataSource = self
    }
    
    private func registerTableViewCells() {
        movieDetailsTableView.register(MovieDetailsTableViewCell.self, forCellReuseIdentifier: "MovieDetailsCell")
        movieDetailsTableView.register(MoviePlotTableViewCell.self, forCellReuseIdentifier: "MoviePlotCell")
        movieDetailsTableView.register(SimilarMoviesHeaderTableViewCell.self, forCellReuseIdentifier: "SimilarMoviesHeaderCell")
        movieDetailsTableView.register(MovieCardTableViewCell.self, forCellReuseIdentifier: "MovieCardCell")
    }
}

extension MovieDetailsViewController: UITableViewDelegate {}

extension MovieDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                guard let cell = movieDetailsTableView.dequeueReusableCell(withIdentifier: "MovieDetailsCell") as? MovieDetailsTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.delegate = self
                cell.selectionStyle = .none
                return cell
            case 1:
                guard let cell = movieDetailsTableView.dequeueReusableCell(withIdentifier: "MoviePlotCell") as? MoviePlotTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.selectionStyle = .none
                return cell
            case 2:
                guard let cell = movieDetailsTableView.dequeueReusableCell(withIdentifier: "SimilarMoviesHeaderCell", for: indexPath) as? SimilarMoviesHeaderTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.delegate = self
                cell.selectionStyle = .none
                return cell
            case 3:
                guard let cell = movieDetailsTableView.dequeueReusableCell(withIdentifier: "MovieCardCell", for: indexPath) as? MovieCardTableViewCell else { return UITableViewCell(frame: .zero) }
                cell.selectionStyle = .none
                cell.delegate = self
                return cell
            default:
                return UITableViewCell(frame: .zero)
        }
       
    }
}

extension MovieDetailsViewController: SimilarMoviesHeaderTableViewCellDelegate {
    func didTapViewAllButton() {
        let similarMoviesVC = SimilarMoviesViewController()
        navigationController?.pushViewController(similarMoviesVC, animated: true)
    }
}

extension MovieDetailsViewController: MovieCardTableViewCellDelegate {
    func didTapMovieCard() {
        let movieDetailVC = MovieDetailsViewController()
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension MovieDetailsViewController: MovieDetailsTableViewCellDelegate {
    func didTapMoviewImage() {
        print("In VC")
        let playerVC = PlayerViewController()
        navigationController?.pushViewController(playerVC, animated: true)
    }
}
