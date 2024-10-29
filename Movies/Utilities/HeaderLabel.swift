//
//  HeaderLabel.swift
//  Movies
//
//  Created by CrewPlace Enterprise on 28/10/24.
//

import UIKit

func createHeaderLabel(text: String, fontSize: CGFloat, textColor: UIColor) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 1
    label.text = text
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
    label.textColor = textColor
    return label
}
