//
//  ImageViewController.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//
 
import UIKit
import Kingfisher

class ImageViewController: UIViewController {
    
    @IBOutlet weak internal var hotelImageView: UIImageView!
    
    internal var index: Int!
    private var url: URL!
    
    init(withURL url:URL, withPageIndex index: Int) {
        self.index = index
        self.url = url
        super.init(nibName: "ImageViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hotelImageView.kf.setImage(with: self.url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
