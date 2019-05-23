//
//  VideoViewController.swift
//  VideoStreams
//
//  Created by Nicholas Long on 5/22/19.
//  Copyright © 2019 NicholasLong. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideoViewController: AVPlayerViewController {

    var avPlayer: AVPlayer? = nil {
        didSet {
            guard let player = avPlayer else { return }
            self.player = player
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showsPlaybackControls = false
        videoGravity = .resizeAspectFill
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

