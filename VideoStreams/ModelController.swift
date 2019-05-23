//
//  ModelController.swift
//  VideoStreams
//
//  Created by Nicholas Long on 5/22/19.
//  Copyright © 2019 NicholasLong. All rights reserved.
//

import AVFoundation
import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [AVPlayer] = []

    override init() {
        super.init()
        if let url1 = URL(string: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8") {
            let player = AVPlayer(url: url1)
            player.play()
            pageData.append(player)
        }
        if let url2 = URL(string: "http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8") {
            let player = AVPlayer(url: url2)
            player.play()
            pageData.append(player)
        }
        if let url3 = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8") {
            let player = AVPlayer(url: url3)
            player.play()
            pageData.append(player)
        }
        if let url4 = URL(string: "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8") {
            let player = AVPlayer(url: url4)
            player.play()
            pageData.append(player)
        }
    }

    func viewControllerAtIndex(_ index: Int,
                               storyboard: UIStoryboard) -> VideoViewController? {
        guard (self.pageData.count != 0 || index >= self.pageData.count),
            let videoVC = storyboard.instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController else {
            return nil
        }
        videoVC.avPlayer = self.pageData[index]
        return videoVC
    }

    func indexOfViewController(_ viewController: VideoViewController) -> Int {
        guard let player = viewController.avPlayer else { return NSNotFound }
        return pageData.firstIndex(of: player) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let videoVC = viewController as? VideoViewController,
            let storyboard = videoVC.storyboard else { return nil }
        var index = self.indexOfViewController(videoVC)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1
        return self.viewControllerAtIndex(index, storyboard: storyboard)
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let videoVC = viewController as? VideoViewController,
            let storyboard = videoVC.storyboard else { return nil }
        var index = self.indexOfViewController(videoVC)
        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: storyboard)
    }

}

