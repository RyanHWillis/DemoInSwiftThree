//
//  HotelDetailContainerViewController.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class HotelDetailContainerViewController: UIViewController {
    
    /**
     Init
     */
    
    fileprivate var hotel: Hotel? = Hotel()
    
    /**
     HotelDetailTableView
    */
    
    fileprivate var hotelDetailTableView: HotelDetailTableView?
    fileprivate var hotelTableViewHeightCS: NSLayoutConstraint?
    fileprivate var paneScrollView: UIScrollView?
    
    
    /**
     Image Header
    */
    
    fileprivate var imageHeaderTopCS: NSLayoutConstraint?
    fileprivate let headerHeight :Float = 300.0
    fileprivate var imagesHeaderView: ImagesHeaderView?
    

    init() {
        super.init(nibName: "HotelDetailContainerViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchHotelData()
        self.title = "Hotel"
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    /**
     Fetch Hotel Data
     */
    
    private func fetchHotelData() {
        APIController.fetchHotel { (hotel) in
            self.hotel = hotel
            self.setup()
        }
    }
    
    private func setup() {
        self.addScrollView()
        self.addImageController()
    }
    
    /**
     Builds our image scrolling header.
     */
    
    private func addImageController() {
        guard let hotel = self.hotel else { return }
        if self.imagesHeaderView != nil { return }
        self.imagesHeaderView = ImagesHeaderView.createImagesHeaderView(withHotel: hotel)
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
    
    /**
     Used to embedd our HotelDetailTableView's content inside a scrollview, so we can really start to customise
     how our container frames react. (This method allows for fine grain customisation).
     */
    
    private func addScrollView() {
        guard let hotel = self.hotel else { return }
        if self.paneScrollView != nil { return }
        self.paneScrollView = UIScrollView()
        self.paneScrollView?.delegate = self
        self.paneScrollView?.backgroundColor = UIColor.black
        self.paneScrollView?.alwaysBounceVertical = true
        self.paneScrollView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.paneScrollView!)
        
        let scrollViews: [String: UIView] = ["scrollView": self.paneScrollView!]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: [], metrics: nil, views: scrollViews))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-64-[scrollView]-40-|", options: [], metrics: nil, views: scrollViews))
        self.view.layoutIfNeeded()
    
        
        self.hotelDetailTableView = HotelDetailTableView(withHotel: hotel, delegate: self)
        self.hotelDetailTableView?.backgroundColor = UIColor.red
        self.hotelDetailTableView?.translatesAutoresizingMaskIntoConstraints = false
        self.paneScrollView?.addSubview(self.hotelDetailTableView!)
        
        let views: [String: UIView] = ["hotelDetailTableView": self.hotelDetailTableView!]
        let metrics: [String: Float] = ["width": Float(UIScreen.main.bounds.width), "height": Float(UIScreen.main.bounds.height), "imageHeader": self.headerHeight]
        self.paneScrollView?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[hotelDetailTableView(width)]-0-|", options: [], metrics: metrics, views: views))
        let constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-imageHeader-[hotelDetailTableView(height)]-0-|", options: [], metrics: metrics, views: views)
        self.hotelTableViewHeightCS = constraints[1]
        self.paneScrollView?.addConstraints(constraints)
        self.view.layoutIfNeeded()
    }
    
    // MARK: - IBActions 
    
    @IBAction private func checkFlights() {
        self.navigationController?.pushViewController(FlightsViewController(), animated: true)
    }
}

extension HotelDetailContainerViewController: UIScrollViewDelegate {
    
    /**
     Used to acheive parralax found on ImageHeaderView embedded in scrollview
     */
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.imageHeaderTopCS?.constant = scrollView.contentOffset.y / 2
        self.view.layoutIfNeeded()
    }
}


extension HotelDetailContainerViewController: HotelDetailTableViewDelegate {
    
    /**
     HotelDetailTableView Automatically changes height, so we
     need to get an update so we can update our containers frame
     */
    
    func hotelDetailTableViewDidUpdate() {
        self.hotelTableViewHeightCS?.constant = self.hotelDetailTableView?.contentSize.height ?? 0.0
        self.view.layoutIfNeeded()
    }
}
