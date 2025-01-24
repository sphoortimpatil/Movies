//
//  MovieListOptionCollectionViewCell.swift
//  Movies
//
//  Created by CrewPlace Enterprise on 28/10/24.
//

import UIKit

class MovieFilterTabWidgetCollectionViewCell: UICollectionViewCell {
   
    private let selectedTabView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 2
        view.layer.borderColor = CustomColor.bodyLabelColor?.cgColor
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
        contentView.addSubview(selectedTabView)
        
        selectedTabView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        selectedTabView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        selectedTabView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        selectedTabView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
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
    
    func updateSelected(_ isSelected: Bool) {
        switch isSelected {
            case true:
                UIView.animate(withDuration: 0.2,
                               animations: {
                    self.selectedTabView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                    self.selectedTabView.alpha = 0.8
                }) { _ in
                    UIView.animate(withDuration: 0.2) {
                        self.selectedTabView.transform = .identity
                        self.selectedTabView.alpha = 1.0
                        self.selectedTabView.layer.borderColor = CustomColor.buttonColor?.resolvedColor(with: self.traitCollection).cgColor
                        self.selectedTabView.backgroundColor = CustomColor.buttonColor
                        self.movieListOptionsLabel.textColor = CustomColor.buttonContentColor
                    }
                }
            case false:
                    self.selectedTabView.layer.borderColor = CustomColor.bodyLabelColor?.cgColor
                    self.selectedTabView.backgroundColor = CustomColor.backgroundColor
                    self.movieListOptionsLabel.textColor = CustomColor.secondaryLabelColor
        }
    }
}
