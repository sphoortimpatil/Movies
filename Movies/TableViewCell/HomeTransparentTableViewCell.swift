//
//  HomeTransparentTableViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 29/10/24.
//

import UIKit

class HomeTransparentTableViewCell: UITableViewCell {
    private let transparentView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureTransparentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTransparentView() {
        contentView.addSubview(transparentView)
        
        transparentView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        transparentView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        transparentView.backgroundColor = .clear
    }
    
}
