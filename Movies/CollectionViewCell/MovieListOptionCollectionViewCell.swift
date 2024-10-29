//
//  MovieListOptionCollectionViewCell.swift
//  Movies
//
//  Created by CrewPlace Enterprise on 28/10/24.
//

import UIKit

class MovieListOptionCollectionViewCell: UICollectionViewCell {
   
    private let selectedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.buttonColor
        view.layer.cornerRadius = 16
        return view
    }()
    
    private let movieListOptionsLabel: UILabel = createHeaderLabel(text: "", fontSize: 13, textColor: CustomColor.secondaryLabelColor ?? .black)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSelectedView()
        configureMovieListOptionsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSelectedView() {
        contentView.addSubview(selectedView)
        
        selectedView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        selectedView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        selectedView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        selectedView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func configureMovieListOptionsLabel() {
        contentView.addSubview(movieListOptionsLabel)
       
        movieListOptionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieListOptionsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        movieListOptionsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        movieListOptionsLabel.textAlignment = .center
    }
    
    func setTabItems(label: String) {
        movieListOptionsLabel.text = label
    }
}
