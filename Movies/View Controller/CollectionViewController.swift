//
//  CollectionViewController.swift
//  Movies
//
//  Created by Sphoorti M Patil on 25/10/24.
//

import UIKit

class CollectionViewController: BaseViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let playerView = VideoPlayerView()
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        setupUI()
        if let videoURL = URL(string: "https://tinyurl.com/3zt32h92") {
            // Use a Task to call the async method
            Task {
                await playerView.prepareToPlay(withUrl: videoURL)
            }
        }
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        // Add container view
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Add player view inside container view
        containerView.addSubview(playerView)
        playerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            playerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
