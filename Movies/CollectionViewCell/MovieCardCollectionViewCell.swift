//
//  MovieCardCollectionViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 29/10/24.
//

import UIKit

class MovieCardCollectionViewCell: UICollectionViewCell {
    private let movieCard = MovieCard(frame: .zero, height: 212, width: 144)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureMovieCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieCard() {
        contentView.addSubview(movieCard)
        
        movieCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        movieCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        movieCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setRating(_ rating: Float) {
        movieCard.setRating(String(rating))
    }
}
