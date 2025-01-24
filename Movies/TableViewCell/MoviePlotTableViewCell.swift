//
//  MoviePlotTableViewCell.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit

class MoviePlotTableViewCell: UITableViewCell {
    
    private let tileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.text = "Plot Summary"
        label.textColor = CustomColor.primaryLabelColor
        return label
    }()
    
    private let plotDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.text = "Former scientist Galen Erso lives on a farm with his wife and addcdchggcdjhcyj young daughter, Jyn. His peaceful existence comes crashing ihaecfileo87eoe9o9 down when the evil Orson Krennic takes him away from his iyefiew6y8orw9fhukr beloved family. Many years later, Galen becomes the Empire's tefiv fwiuyfiwe feuy lead engineer for the most powerful weapon in the galaxy, the ywgefiu jwgeuf jwgeifuw"
        label.textColor = CustomColor.bodyLabelColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = CustomColor.backgroundColor
        configureTitleLabel()
        configurePlotDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTitleLabel() {
        contentView.addSubview(tileLabel)
        
        tileLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        tileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        tileLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configurePlotDescriptionLabel() {
        contentView.addSubview(plotDescriptionLabel)
        
        plotDescriptionLabel.topAnchor.constraint(equalTo: tileLabel.bottomAnchor, constant: 10).isActive = true
        plotDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        plotDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        plotDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
