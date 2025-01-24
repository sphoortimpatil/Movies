//
//  UIView+RoundLeftCorner.swift.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit

// Define the extension to round left corners
extension UIView {
    func roundLeftCorners(radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: [.topLeft, .bottomLeft],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
}
