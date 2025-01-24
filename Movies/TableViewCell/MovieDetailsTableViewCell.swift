//
//  MovieDetailsTableViewCell.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit

protocol MovieDetailsTableViewCellDelegate: AnyObject {
    func didTapMoviewImage()
}

class MovieDetailsTableViewCell: UITableViewCell {
    weak var delegate: MovieDetailsTableViewCellDelegate?
    private let shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 6
        view.layer.masksToBounds = false
        return view
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let castAndCrewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Cast & Crew"
        label.numberOfLines = 2
        return label
    }()
    
    private let castAndCrewTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = CustomColor.backgroundColor
        tableView.register(CastAndCrewImageTableViewCell.self, forCellReuseIdentifier: "CastAndCrewImageCell")
        return tableView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = CustomColor.backgroundColor
        configureShadowContainerView()
        configureMovieImageView()
        configureCastAndCrewLabel()
        configureCastAndCrewtableView()
        setUpDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
   
        movieImageView.roundLeftCorners(radius: 80)
    }
    
    private func configureShadowContainerView() {
        contentView.addSubview(shadowContainerView)
        
        shadowContainerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        shadowContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        shadowContainerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.55).isActive = true
        shadowContainerView.heightAnchor.constraint(equalTo: shadowContainerView.widthAnchor, multiplier: 2.0).isActive = true
        shadowContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func configureMovieImageView() {
        movieImageView.image = UIImage(named: "MovieImage")
        shadowContainerView.addSubview(movieImageView)
      
        movieImageView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: shadowContainerView.widthAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalTo: movieImageView.widthAnchor).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor).isActive = true
        
        movieImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMovieImageTap))
        movieImageView.addGestureRecognizer(tapGesture)
    }
    
    private func configureCastAndCrewLabel() {
        contentView.addSubview(castAndCrewLabel)
        
        castAndCrewLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        castAndCrewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        castAndCrewLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.40).isActive = true
    }
    
    private func configureCastAndCrewtableView() {
        contentView.addSubview(castAndCrewTableView)
        
        castAndCrewTableView.topAnchor.constraint(equalTo: castAndCrewLabel.bottomAnchor, constant: 5).isActive = true
        castAndCrewTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        castAndCrewTableView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.40).isActive = true
        castAndCrewTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setUpDelegate() {
        castAndCrewTableView.delegate = self
        castAndCrewTableView.dataSource = self
    }
    
    @objc private func handleMovieImageTap() {
        print("tapped")
        delegate?.didTapMoviewImage()
    }
}

extension MovieDetailsTableViewCell: UITableViewDelegate {}

extension MovieDetailsTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = castAndCrewTableView.dequeueReusableCell(withIdentifier: "CastAndCrewImageCell") as? CastAndCrewImageTableViewCell else { return UITableViewCell(frame: .zero)}
        cell.selectionStyle = .none
        return cell
    }
}
