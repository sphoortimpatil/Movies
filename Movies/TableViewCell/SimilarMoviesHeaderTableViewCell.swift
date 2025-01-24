//
//  SimilarMoviesHeaderTableViewCell.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit
protocol SimilarMoviesHeaderTableViewCellDelegate: AnyObject {
    func didTapViewAllButton()
}

class SimilarMoviesHeaderTableViewCell: UITableViewCell {
    weak var delegate: SimilarMoviesHeaderTableViewCellDelegate?
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "Similar Movies"
        label.numberOfLines = 1
        return label
    }()
    
    private let viewAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View All", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(CustomColor.buttonColor, for: .normal)
        button.backgroundColor = .clear
     
        
        let arrowImage = UIImage(systemName: "arrow.right")
        button.setImage(arrowImage, for: .normal)
        
        button.tintColor = CustomColor.buttonColor
        button.semanticContentAttribute = .forceRightToLeft
        
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = CustomColor.backgroundColor
        configureHeaderLabel()
        configureViewAllButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeaderLabel() {
        contentView.addSubview(headerLabel)
        
        headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    private func configureViewAllButton() {
        contentView.addSubview(viewAllButton)
        
        viewAllButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        viewAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        viewAllButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        viewAllButton.addTarget(self, action: #selector (viewAllButtonTapped), for: .touchUpInside)
    }

    @objc private func viewAllButtonTapped() {
        print("View all button tapped")
        delegate?.didTapViewAllButton()
    }
}
