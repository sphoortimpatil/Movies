//
//  LeftCornerRoundedImageView.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit

class LeftCornerRoundedImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Define a path with rounded corners on the top left and bottom left
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))  // Top left
        path.addLine(to: CGPoint(x: self.bounds.width, y: 0))  // Top right
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))  // Bottom right
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height))  // Bottom left
        path.addArc(withCenter: CGPoint(x: 0, y: 0), radius: 20, startAngle: .pi, endAngle: 1.5 * .pi, clockwise: true)  // Top-left corner
        path.addArc(withCenter: CGPoint(x: 0, y: self.bounds.height), radius: 20, startAngle: 0.5 * .pi, endAngle: .pi, clockwise: true)  // Bottom-left corner
        path.close()
        
        // Set the mask layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }

}
