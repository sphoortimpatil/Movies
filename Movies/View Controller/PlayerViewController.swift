//
//  PlayerViewController.swift
//  Movies
//
//  Created by Sphoorti Patil on 30/12/24.
//

import UIKit
import WebKit

class PlayerViewController: BaseViewController {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
//        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: self.view.bounds, configuration: webConfiguration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]  // Allow resizing
        self.view.addSubview(webView)
        getVideoKey()
        setupYouTubePlayer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func getVideoKey() {
        let apiKey = "ba8688ee8e065db6ea68cc68d5c24ba2" // Replace with your actual TMDB API key
        let movieID = 762509 // Avatar: The Way of Water movie ID
        let urlString = "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=\(apiKey)&language=en-US"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching trailer: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let response = try JSONDecoder().decode(VideoResponse.self, from: data)
                if let trailer = response.results.first(where: { $0.type == "Trailer" }) {
                    let trailerURL = "https://www.youtube.com/watch?v=\(trailer.key)"
                    print("Trailer URL: \(trailerURL)")
                } else {
                    print("No trailer found.")
                }
            } catch {
                print("Error decoding response: \(error)")
            }
        }.resume()
        
        // VideoResponse model:
        struct VideoResponse: Codable {
            let results: [Video]
        }
        
        struct Video: Codable {
            let key: String
            let type: String
        }
    }
    
    func setupYouTubePlayer() {
        let videoID = "lMXh6vjiZrI"  // Video ID from TMDb response
        let embedURL = "https://www.youtube.com/watch?v=\(videoID)"
        if let url = URL(string: embedURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        } else {
            print("Invalid YouTube URL")
        }
    }
    
}

