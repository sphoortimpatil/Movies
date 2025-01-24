//
//  SimilarMoviesCollectionViewCell.swift
//  Movies
//
//  Created by Sphoorti Patil on 26/12/24.
//

import UIKit

class SimilarMoviesCollectionViewCell: UICollectionViewCell {
    private let movieImageCard = MovieImageCard(height: 180, width: 0, isRatingHidden: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureMovieImageCard()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieImageCard() {
        contentView.addSubview(movieImageCard)
        movieImageCard.translatesAutoresizingMaskIntoConstraints = false
        
        movieImageCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        movieImageCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieImageCard.heightAnchor.constraint(equalToConstant: 180).isActive = true
        movieImageCard.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        movieImageCard.hideRating()
    }
    
    func setRating(_ rating: Float) {
        movieImageCard.setRating(String(rating))
    }
}
