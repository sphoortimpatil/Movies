//
//  MovieCard.swift
//  Movies
//
//  Created by Sphoorti M Patil on 29/10/24.
//

import UIKit

class MovieImageCard: UIView {
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(named: "MovieImage")
        imageView.image = iconImage
        imageView.tintColor  = CustomColor.secondaryLabelColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let ratingView = UIView()
    private let ratingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = CustomColor.backgroundColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var height: CGFloat = 212
    var width: CGFloat = 144
    private let ratingLabel = createHeaderLabel(text: "", fontSize: 14.0, textColor: CustomColor.backgroundColor ?? .black)
    
     init(height: CGFloat, width: CGFloat) {
        super.init(frame: .zero)
         
         self.width = width
         self.height = height
        
        configureMovieImageView()
        configureRatingView()
        configureRatingImageView()
        configureRatinglabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieImageView() {
        self.addSubview(movieImageView)
        
        movieImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        movieImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: height - 37).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    private func configureRatingView() {
        self.addSubview(ratingView)
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        
        ratingView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 5).isActive = true
        ratingView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        ratingView.widthAnchor.constraint(equalToConstant: 72).isActive = true
        ratingView.layer.cornerRadius = 4
        ratingView.backgroundColor = CustomColor.primaryLabelColor
    }
    
    private func configureRatingImageView() {
        ratingView.addSubview(ratingImageView)
        
        ratingImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ratingImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        ratingImageView.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor, constant: 5).isActive = true
        ratingImageView.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
    }
    
    private func configureRatinglabel() {
        ratingView.addSubview(ratingLabel)
        
        ratingLabel.heightAnchor.constraint(equalTo: ratingView.heightAnchor).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: ratingImageView.trailingAnchor, constant: 5).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor).isActive = true
        ratingLabel.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: -5).isActive = true
        ratingLabel.textAlignment = .left
    }
    
    func setRating(_ rating: String) {
        ratingLabel.text = rating
    }
}
