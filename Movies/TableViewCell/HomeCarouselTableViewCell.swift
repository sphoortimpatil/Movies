//
//  HomeCarouselTableViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 28/10/24.
//

import UIKit

class HomeCarouselTableViewCell: UITableViewCell {
    private let trendingLabel: UILabel = createHeaderLabel(text: "Buzzing", fontSize: 20, textColor: CustomColor.primaryLabelColor ?? .white)
    private let carouselView = UIView()
    private let carouselCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: "CarouselCell")
        collectionView.backgroundColor = CustomColor.backgroundColor
        collectionView.isPagingEnabled = true
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.1
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 4)
        collectionView.layer.shadowRadius = 18
        collectionView.layer.masksToBounds = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .white
        return pageControl
    }()
    private var currentPage = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = CustomColor.backgroundColor
        configureTrendingLabel()
        configureCarouselView()
        configureCarouselCollectionView()
        configurePageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTrendingLabel() {
        contentView.addSubview(trendingLabel)
        
        trendingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        trendingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        trendingLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier:  7 / 8, constant: 0).isActive = true
        trendingLabel.textAlignment = .left
    }
    
    private func configureCarouselView() {
        contentView.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        
        carouselView.topAnchor.constraint(equalTo: trendingLabel.bottomAnchor, constant: 10).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: 550).isActive = true
        carouselView.clipsToBounds = true
    }
    
    
    private func configureCarouselCollectionView() {
        carouselView.addSubview(carouselCollectionView)
        
        carouselCollectionView.backgroundColor = CustomColor.backgroundColor
        carouselCollectionView.heightAnchor.constraint(equalTo: carouselView.heightAnchor, constant: 0).isActive = true
        carouselCollectionView.widthAnchor.constraint(equalTo: carouselView.widthAnchor).isActive = true
        carouselCollectionView.centerYAnchor.constraint(equalTo: carouselView.centerYAnchor).isActive = true
        carouselCollectionView.centerXAnchor.constraint(equalTo: carouselView.centerXAnchor).isActive = true
        
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
    }
    
    private func configurePageControl() {
        carouselView.addSubview(pageControl)
        
        pageControl.topAnchor.constraint(equalTo: carouselCollectionView.bottomAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.widthAnchor.constraint(equalTo: carouselView.widthAnchor, multiplier: 5 / 8).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: carouselView.centerXAnchor).isActive = true
    }
}

extension HomeCarouselTableViewCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let indexPath = carouselCollectionView.indexPathsForVisibleItems.first else { return }
        pageControl.currentPage = indexPath.row
        carouselCollectionView.reloadData()
    }
}

extension HomeCarouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: "CarouselCell", for: indexPath) as? CarouselCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
        cell.layer.cornerRadius = 24
        return cell
    }
}

extension HomeCarouselTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout , sizeForItemAt indexPath: IndexPath)->CGSize {
        let itemWidth = carouselCollectionView.frame.width - 15
        let itemHeight = carouselCollectionView.frame.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 7.5, bottom: 0, right: 7.5)
    }

}
