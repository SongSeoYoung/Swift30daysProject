//
//  ViewController.swift
//  Project 16 - SpotifySignIn
//
//  Created by 송서영 on 2021/02/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet private weak var logInBtn: UIButton!
    @IBOutlet private weak var signUpBtn: UIButton!
    @IBOutlet private weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVideoPlay()
        setUI()
    }
    
    private var player: AVPlayer?
    
    private func setVideoPlay() {
        guard let path = Bundle.main.path(forResource: "moments", ofType: "mp4") else { return }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoView.layer.addSublayer(playerLayer)
        player?.seek(to: CMTime.zero)
        player?.play()
        NotificationCenter.default
            .addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                        object: nil,
                        queue: nil)
            { [weak self] note in
            self?.player?.seek(to: CMTime.zero)
            self?.player?.play()
        }
    }
    
    private func setUI() {
        logInBtn.alpha = 0.9
        signUpBtn.alpha = 0.9
    }
    
    
}

