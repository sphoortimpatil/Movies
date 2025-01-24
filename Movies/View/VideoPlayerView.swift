//
//  VideoPlayerView.swift
//  Movies
//
//  Created by Sphoorti Patil on 25/12/24.
//

import UIKit
import AVKit

class VideoPlayerView: UIView {

    private let playerLayer = AVPlayerLayer()
    private var urlAsset: AVURLAsset?
    private var playerItem:AVPlayerItem?
    private var assetPlayer:AVPlayer? {
        didSet {
            DispatchQueue.main.async {
                if let layer = self.layer as? AVPlayerLayer {
                    layer.player = self.assetPlayer
                }
            }
        }
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupPlayerLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    private func setupPlayerLayer() {
        playerLayer.videoGravity = .resizeAspectFill
//        playerLayer.videoGravity =  AVLayerVideoGravity.resizeAspect
        layer.addSublayer(playerLayer)
    }
    
    func prepareToPlay(withUrl url:URL) async {
        // 1.
        let options: [String: Any] = [AVURLAssetPreferPreciseDurationAndTimingKey: true]
        urlAsset = AVURLAsset(url: url, options: options)
        
        guard let urlAsset = urlAsset else { return }
        
        do {
            // Load tracks asynchronously
            let tracks = try await urlAsset.load(.tracks)
            print("Tracks loaded: \(tracks)")
            
            startLoading(urlAsset)
        } catch {
            print("Error loading asset tracks: \(error.localizedDescription)")
        }
    
    }
    
    private func startLoading(_ asset: AVURLAsset) {
        let playerItem = AVPlayerItem(asset: asset)
        self.playerItem = playerItem
        
        let player = AVPlayer(playerItem: playerItem)
        self.assetPlayer = player
        player.play()
    }
    
    func play() {
        guard assetPlayer?.isPlaying == false else { return }
        DispatchQueue.main.async {
            self.assetPlayer?.play()
        }
    }
    
    func pause() {
        guard assetPlayer?.isPlaying == true else { return }
        DispatchQueue.main.async {
            self.assetPlayer?.pause()
        }
    }
    
    func cleanUp() {
        pause()
        urlAsset?.cancelLoading()
        urlAsset = nil
        assetPlayer = nil
    }
    
    deinit {
        cleanUp()
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        rate != 0 && error == nil
    }
}
