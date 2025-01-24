//
//  MovieListDataTableViewCell.swift
//  Movies
//
//  Created by Sphoorti Patil on 19/12/24.
//

import UIKit

class MovieListDataTableViewCell: UITableViewCell {
    private let movieImageCard = MovieImageCard(height: 176, width: 92, isRatingHidden: false)
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 1
        label.text = "House of Cards Cards"
        label.textAlignment = .left
        return label
    }()
    private let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.text = "Cheese on toast airedale the big cheese. Danish fontina cheesy grin airedale danish fontina taleggio the big cheese macaroni cheese port-salut. Edam fromage lancashire feta caerphilly. taleggio the big cheese macaroni cheese port-salut. Edam fromage lancashire feta caerphilly. taleggio the big cheese macaroni cheese port-salut. Edam fromage lancashire feta caerphilly."
        label.textAlignment = .left
//        label.textColor = UIColor(red: 106/255.0, green: 106/255.0, blue: 114/255.0, alpha: 1.0)
        label.textColor = CustomColor.bodyLabelColor
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = CustomColor.backgroundColor
        configureMovieImageCard()
        configureMovieNameLabel()
        configureMovieDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieImageCard() {
        contentView.addSubview(movieImageCard)
        movieImageCard.translatesAutoresizingMaskIntoConstraints = false
        
        movieImageCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        movieImageCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        movieImageCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        movieImageCard.widthAnchor.constraint(equalToConstant: 92).isActive = true
        movieImageCard.heightAnchor.constraint(equalToConstant: 176).isActive = true
    }
    
    private func configureMovieNameLabel() {
        contentView.addSubview(movieNameLabel)
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: movieImageCard.trailingAnchor, constant: 16).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        movieNameLabel.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
    
    private func configureMovieDescriptionLabel() {
        contentView.addSubview(movieDescriptionLabel)
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        movieDescriptionLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 6).isActive = true
        movieDescriptionLabel.leadingAnchor.constraint(equalTo: movieImageCard.trailingAnchor, constant: 16).isActive = true
        movieDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        movieDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        movieDescriptionLabel.setLineHeight(lineHeight: 20)
    }
    

}
