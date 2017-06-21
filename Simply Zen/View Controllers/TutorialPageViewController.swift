//
//  TutorialPageViewController.swift
//  Simply Zen
//
//  Created by Daniel Pratt on 6/1/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newTutorialVC("pageOne"),
                self.newTutorialVC("pageTwo"),
                self.newTutorialVC("pageThree"),
                self.newTutorialVC("pageFour"),
                self.newTutorialVC("pageFive"),
                self.newTutorialVC("pageSix"),
                self.newTutorialVC("pageSeven"),
                self.newTutorialVC("pageEight")
                ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        // Load up first VC
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Create VCs
    
    func newTutorialVC(_ name: String) -> UIViewController {
        let tutorialVC = storyboard?.instantiateViewController(withIdentifier: name) as! TutorialViewController
        tutorialVC.pageName = name
        return tutorialVC
    }
    
    // MARK: - UIPageViewControllerDataSource Protocol Methods
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    

}
