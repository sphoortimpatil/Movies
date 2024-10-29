//
//  MovieCardTableViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 29/10/24.
//

import UIKit

class MovieCardTableViewCell: UITableViewCell {

    private let movieListOptions = [1.0, 2.0, 8, 9.0, 10]
    private let movieCardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MovieCardCollectionViewCell.self, forCellWithReuseIdentifier: "MovieCardCell")
        collectionView.backgroundColor = CustomColor.backgroundColor
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = CustomColor.backgroundColor
        configureMovieOptionsLabelCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieOptionsLabelCollectionView() {
        contentView.addSubview(movieCardCollectionView)
        
        movieCardCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieCardCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieCardCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        movieCardCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        movieCardCollectionView.heightAnchor.constraint(equalToConstant: 262).isActive = true
        
        movieCardCollectionView.dataSource = self
        movieCardCollectionView.delegate = self
    }
}

extension MovieCardTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieListOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = movieCardCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCardCell", for: indexPath) as? MovieCardCollectionViewCell else { return UICollectionViewCell(frame: .zero)}
        cell.setRating(Float(movieListOptions[indexPath.row]))
        return cell
    }
}

extension MovieOptionTableViewCell: UICollectionViewDelegate {}

extension MovieCardTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 260)
    }

}
