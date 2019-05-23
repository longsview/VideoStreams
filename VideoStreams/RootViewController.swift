//
//  RootViewController.swift
//  VideoStreams
//
//  Created by Nicholas Long on 5/22/19.
//  Copyright © 2019 NicholasLong. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDelegate {

    private lazy var modelController: ModelController = .init()
    var pageViewController: UIPageViewController = .init(transitionStyle: .scroll,
                                                         navigationOrientation: .horizontal,
                                                         options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let storyboard = storyboard,
            let start = modelController.viewControllerAtIndex(0, storyboard: storyboard) else { return }
        pageViewController.dataSource = self.modelController
        pageViewController.setViewControllers([start],
                                              direction: .forward,
                                              animated: false,
                                              completion: {done in })

        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.view.frame = view.bounds
        pageViewController.didMove(toParent: self)
    }
}

