//
//  CarousalCollectionViewFlowLayout.swift
//  Movies
//
//  Created by Sphoorti Patil on 30/11/24.
//

import UIKit

class CarousalCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    
    override func prepare() {
        super.prepare()
        
        scrollDirection = .horizontal
        minimumLineSpacing = 16
        minimumInteritemSpacing = 16
        itemSize = CGSize(width: 550, height: 400)
    }
}
