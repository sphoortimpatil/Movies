//
//  MovieCardCollectionViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 29/10/24.
//

import UIKit

class MovieCardCollectionViewCell: UICollectionViewCell {
    private let movieImageCard = MovieImageCard(height: 250, width: 144)
    
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
        
        movieImageCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        movieImageCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieImageCard.widthAnchor.constraint(equalToConstant: 144).isActive = true
        movieImageCard.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func setRating(_ rating: Float) {
        movieImageCard.setRating(String(rating))
    }
}
