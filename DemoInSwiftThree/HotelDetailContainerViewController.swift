//
//  HotelDetailContainerViewController.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class HotelDetailContainerViewController: UIViewController {
    
    private let headerHeight :Float = 300.0
    private var imagesHeaderView: ImagesHeaderView?
    
    init() {
        super.init(nibName: "HotelDetailContainerViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addImageController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func addImageController() {
        if self.imagesHeaderView != nil { return }
        self.imagesHeaderView = ImagesHeaderView.createImagesHeaderView()
        self.imagesHeaderView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.imagesHeaderView!)
        
        let view: [String: UIView] = ["imagesHeaderView": self.imagesHeaderView!]
        let metrics: [String: Float] = ["height": self.headerHeight]

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imagesHeaderView]|", options: [], metrics: nil, views: view))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imagesHeaderView(height)]", options: [], metrics: metrics, views: view))
        self.view.layoutIfNeeded()
    }
}
