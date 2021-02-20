//
//  ViewController.swift
//  Project 16 - SpotifySignIn
//
//  Created by 송서영 on 2021/02/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setVideoPlay()
    }
    func setVideoPlay() {
        guard let path = Bundle.main.path(forResource: "moments", ofType: "mp4") else { return }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.addSublayer(playerLayer)
        player.seek(to: CMTime.zero)
        player.play()
    }


}

