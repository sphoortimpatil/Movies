//
//  MovieOptionTableViewCell.swift
//  Movies
//
//  Created by Sphoorti M Patil on 28/10/24.
//

import UIKit

protocol MovieFilterTabWidgetsTableViewCellDelegate: AnyObject {
    func didSelectTabWidgetOption(index: Int)
}

class MovieFilterTabWidgetsTableViewCell: UITableViewCell {
    weak var delegate: MovieFilterTabWidgetsTableViewCellDelegate?
    private var selectedIndex: Int = 0
    private let movieListOptions = Constants.movieListOptionsLabel
    private let movieOptionsLabelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MovieFilterTabWidgetCollectionViewCell.self, forCellWithReuseIdentifier: "MovieListOptionCell")
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
        contentView.addSubview(movieOptionsLabelCollectionView)
        
        movieOptionsLabelCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieOptionsLabelCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        movieOptionsLabelCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        movieOptionsLabelCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        movieOptionsLabelCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        movieOptionsLabelCollectionView.dataSource = self
        movieOptionsLabelCollectionView.delegate = self
    }
}

extension MovieFilterTabWidgetsTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieListOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = movieOptionsLabelCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieListOptionCell", for: indexPath) as? MovieFilterTabWidgetCollectionViewCell else { return UICollectionViewCell(frame: .zero)}
        cell.setTabItems(label: movieListOptions[indexPath.row])
        if indexPath.row == 0 {
            delegate?.didSelectTabWidgetOption(index: 0)
            cell.updateSelected(true)
        }
        return cell
    }
}

extension MovieFilterTabWidgetsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndex != indexPath.row {
            let previousIndexPath = IndexPath(row: selectedIndex, section: 0)
            if let previousCell = collectionView.cellForItem(at: previousIndexPath) as? MovieFilterTabWidgetCollectionViewCell {
                previousCell.updateSelected(false)
            }
            
            selectedIndex = indexPath.row
            if let newTabSelectionCell = collectionView.cellForItem(at: indexPath) as? MovieFilterTabWidgetCollectionViewCell {
                delegate?.didSelectTabWidgetOption(index: selectedIndex)
                newTabSelectionCell.updateSelected(true)
            }
        }
    }
}

extension MovieFilterTabWidgetsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
}
