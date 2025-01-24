//
//  CastAndCrewImageTableViewCell.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit

class CastAndCrewImageTableViewCell: UITableViewCell {
    private let shadowContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 3
        view.layer.masksToBounds = false
        return view
    }()
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "taylor Swift Swift Swift"
        label.textColor = CustomColor.secondaryLabelColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = CustomColor.backgroundColor
        configureShadowContainerView()
        configureMovieImageView()
        configureNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureShadowContainerView() {
        contentView.addSubview(shadowContainerView)
        
        shadowContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        shadowContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        shadowContainerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        shadowContainerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shadowContainerView.layer.cornerRadius = 50
    }
    
    private func configureMovieImageView() {
        shadowContainerView.addSubview(movieImageView)
        
        movieImageView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor).isActive = true
        
        movieImageView.layer.cornerRadius = 50
        movieImageView.layer.masksToBounds = true
        movieImageView.layer.borderWidth = 3
        movieImageView.layer.borderColor = CustomColor.primaryLabelColor?.cgColor
    }
    
    private func configureNameLabel() {
        contentView.addSubview(nameLabel)
        
        nameLabel.topAnchor.constraint(equalTo: shadowContainerView.bottomAnchor, constant: 5).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
}
