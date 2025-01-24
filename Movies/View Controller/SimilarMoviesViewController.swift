//
//  SimilarMoviesViewController.swift
//  Movies
//
//  Created by Sphoorti Patil on 26/12/24.
//

import UIKit

class SimilarMoviesViewController: BaseViewController {
    private let similarMovieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(SimilarMoviesCollectionViewCell.self, forCellWithReuseIdentifier: "SimilarMoviesCell")
        collectionView.backgroundColor = CustomColor.backgroundColor
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = CustomColor.primaryLabelColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSimilarMoviesCollectionView()
        setUpDelegates()
    }
    
    private func configureSimilarMoviesCollectionView() {
        view.addSubview(similarMovieCollectionView)
        
        similarMovieCollectionView.topAnchor.constraint(equalTo: baseView.topAnchor).isActive = true
        similarMovieCollectionView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor).isActive = true
        similarMovieCollectionView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor).isActive = true
        similarMovieCollectionView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor).isActive = true
    }
    
    private func setUpDelegates() {
        similarMovieCollectionView.delegate = self
        similarMovieCollectionView.dataSource = self
    }

}

extension SimilarMoviesViewController: UICollectionViewDelegate {}

extension SimilarMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = (collectionView.frame.width - 36) / 3
        let itemHeight: CGFloat = 190
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}

extension SimilarMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = similarMovieCollectionView.dequeueReusableCell(withReuseIdentifier: "SimilarMoviesCell", for: indexPath) as? SimilarMoviesCollectionViewCell else { return UICollectionViewCell(frame: .zero)}
        return cell
    }
}
