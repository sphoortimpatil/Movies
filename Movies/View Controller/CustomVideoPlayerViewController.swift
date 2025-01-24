//
//  CustomVideoPlayerViewController.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit
import AVKit
import AVFoundation

class CustomVideoPlayerViewController: UIViewController {
    private var playerContainerView =  UIView()
    private var playButton: UIButton!
    private var seekSlider: UISlider!
    private var currentTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setUpPlayerContainerView() {
        playerContainerView.backgroundColor = .black
        
        playerContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerContainerView)
        
        playerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        playerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        playerContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
    }
}
