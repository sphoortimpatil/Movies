//
//  MovieDetailsHeaderView.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit

class MovieDetailsHeaderView: UIView {
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Rogue One Part Two: The Tale of Fire and Ice: Part 3, John Snow"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = CustomColor.customPurple
        return label
    }()
    
    private let starIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .systemYellow
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let ratinglabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "8.4"
        label.textAlignment = .left
        label.textColor = CustomColor.secondaryLabelColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let collectionIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "tag")
        //        imageView.tintColor = .systemYellow
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let mpaRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "Action, SciFi"
        label.textAlignment = .left
        label.textColor = CustomColor.secondaryLabelColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "English"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = CustomColor.secondaryLabelColor
        return label
    }()
    private let seperatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = "|"
        label.textAlignment = .center
        label.textColor = CustomColor.secondaryLabelColor
        label.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureMovieNameLabel()
        configureStarIconImageView()
        configureRatingLabel()
        configureCollectionIconImageView()
        configureMpaRatingLabel()
        configureSeperatorLabel()
        configureLanguageLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieNameLabel() {
        self.addSubview(movieNameLabel)
        
        movieNameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        movieNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        movieNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureStarIconImageView() {
        self.addSubview(starIconImageView)
        
        starIconImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10).isActive = true
        starIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
//        starIconImageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        starIconImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        starIconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    private func configureRatingLabel() {
        self.addSubview(ratinglabel)
        
        ratinglabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10).isActive = true
        ratinglabel.leadingAnchor.constraint(equalTo: starIconImageView.trailingAnchor, constant: 10).isActive = true
        ratinglabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    private func configureCollectionIconImageView() {
        self.addSubview(collectionIconImageView)
        
        collectionIconImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 10).isActive = true
        collectionIconImageView.leadingAnchor.constraint(equalTo: ratinglabel.trailingAnchor, constant: 10).isActive = true

        collectionIconImageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
        collectionIconImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    private func configureMpaRatingLabel() {
        self.addSubview(mpaRatingLabel)
        
        mpaRatingLabel.centerYAnchor.constraint(equalTo: ratinglabel.centerYAnchor, constant: 0).isActive = true
        mpaRatingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        mpaRatingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    private func configureSeperatorLabel() {
        self.addSubview(seperatorLabel)
        
        seperatorLabel.firstBaselineAnchor.constraint(equalTo: mpaRatingLabel.firstBaselineAnchor).isActive = true
        seperatorLabel.trailingAnchor.constraint(equalTo: mpaRatingLabel.leadingAnchor, constant: -5).isActive = true
        seperatorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    private func configureLanguageLabel() {
        self.addSubview(languageLabel)
        
        languageLabel.centerYAnchor.constraint(equalTo: ratinglabel.centerYAnchor, constant: 0).isActive = true
        languageLabel.trailingAnchor.constraint(equalTo: seperatorLabel.leadingAnchor, constant: -5).isActive = true
        languageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
}
