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
    internal var imageHeaderTopCS: NSLayoutConstraint?
    
    private var paneScrollView: UIScrollView?
    
    init() {
        super.init(nibName: "HotelDetailContainerViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addScrollView()
        self.addImageController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func addImageController() {
        if self.imagesHeaderView != nil { return }
        self.imagesHeaderView = ImagesHeaderView.createImagesHeaderView()
        self.imagesHeaderView?.translatesAutoresizingMaskIntoConstraints = false
        self.paneScrollView?.insertSubview(self.imagesHeaderView!, at: 0)
        
        let view: [String: UIView] = ["imagesHeaderView": self.imagesHeaderView!]
        let metrics: [String: Float] = ["height": self.headerHeight]

        self.paneScrollView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[imagesHeaderView]-0-|", options: [], metrics: nil, views: view))
        let contraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[imagesHeaderView(height)]", options: [], metrics: metrics, views: view)
        self.imageHeaderTopCS = contraints[0]
        self.paneScrollView?.addConstraints(contraints)
        self.view.layoutIfNeeded()
    }
    
    private func addScrollView() {
        if self.paneScrollView != nil { return }
        self.paneScrollView = UIScrollView()
        self.paneScrollView?.delegate = self
        self.paneScrollView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.paneScrollView!)
        
        let scrollViews: [String: UIView] = ["scrollView": self.paneScrollView!]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: [], metrics: nil, views: scrollViews))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: [], metrics: nil, views: scrollViews))
        self.view.layoutIfNeeded()
        
        
        let placeView = UIView()
        placeView.backgroundColor = UIColor.blue
        placeView.translatesAutoresizingMaskIntoConstraints = false
        self.paneScrollView?.addSubview(placeView)
        
        let views: [String: UIView] = ["testView": placeView]
        let metrics: [String: Float] = ["width": Float(UIScreen.main.bounds.width), "height": 1000, "imageHeader": self.headerHeight]
        self.paneScrollView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[testView(width)]-0-|", options: [], metrics: metrics, views: views))
        self.paneScrollView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-imageHeader-[testView(height)]-0-|", options: [], metrics: metrics, views: views))
        self.view.layoutIfNeeded()
    }
}

extension HotelDetailContainerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.imageHeaderTopCS?.constant = scrollView.contentOffset.y / 2
        self.view.layoutIfNeeded()
    }
}
