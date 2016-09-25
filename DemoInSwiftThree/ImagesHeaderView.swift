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
    fileprivate var nextIndex = 1
    fileprivate var currentIndex = 0
    
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
        
        if let controller = self.imageControllerAtIndex(index: 0) {
            self.pageViewController.setViewControllers([controller], direction: .forward, animated: false, completion: nil)
        }

        self.pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.pageViewController.view)

        let view: [String: UIView] = ["pageViewController": self.pageViewController.view]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageViewController]|", options: [], metrics: nil, views: view))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageViewController]|", options: [], metrics: nil, views: view))
        self.layoutIfNeeded()
    }
    
    func imageControllerAtIndex(index: Int) -> ImageViewController? {
        
        guard let url = self.hotel.images?[index] else {
            return nil
        }
        
        return ImageViewController(withURL: url, withPageIndex: index)
    }
}

extension ImagesHeaderView: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ImageViewController
        let index = vc.index as Int
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        return self.imageControllerAtIndex(index: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ImageViewController
        let index = vc.index as Int
        guard let count = self.hotel.images?.count else { return nil }

        
        if index == NSNotFound || index == count - 1 {
            return nil
        }
        
        return self.imageControllerAtIndex(index: index + 1)
    }
}

extension ImagesHeaderView: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        let vc = pendingViewControllers[0] as! ImageViewController
        self.nextIndex = vc.index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            self.currentIndex = self.nextIndex
        }
    }
}
