//
//  ImagesHeaderView.swift
//  DemoInSwiftThree
//
//  Created by Ryan Willis on 24/09/2016.
//  Copyright © 2016 RyanWillis. All rights reserved.
//

import UIKit

class ImagesHeaderView: UIView {
    
    fileprivate var pageViewController: UIPageViewController!
    fileprivate var hotel: Hotel!

    public class func createImagesHeaderView(withHotel hotel: Hotel) -> ImagesHeaderView {
        let loader = Bundle.main.loadNibNamed("ImagesHeaderView", owner: self, options: nil)?.first as! ImagesHeaderView
        loader.hotel = hotel
        loader.setupPageController()
        return loader
    }
    
    private func setupPageController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.view.backgroundColor = UIColor.black
        self.pageViewController.dataSource = self
        self.pageViewController.delegate   = self
        self.pageViewController.setViewControllers([ImageViewController()], direction: .forward, animated: false, completion: nil)

        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.pageViewController.view)

        let view: [String: UIView] = ["pageViewController": self.pageViewController.view]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageViewController]|", options: [], metrics: nil, views: view))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageViewController]|", options: [], metrics: nil, views: view))
        self.layoutIfNeeded()
    }
    
}

extension ImagesHeaderView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return ImageViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return ImageViewController()
    }
}

extension ImagesHeaderView: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let vc = pendingViewControllers[0] as! ImageViewController
        //self.nextIndex = vc.pageIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //if completed {
            
         //   print(self.nextIndex)
         //   self.currentIndex = self.nextIndex
          //  self.calculateButtonsShown(self.currentIndex)
       // }
    }
}
