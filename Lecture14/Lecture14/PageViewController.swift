//
//  ViewController.swift
//  Lecture14
//
//  Created by Van Simmons on 5/8/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var page1ViewController: Page3ViewController!
    var page2ViewController: Page2ViewController!
    var page3ViewController: Page1ViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        page1ViewController = self.storyboard!.instantiateViewController(withIdentifier: "Page3ViewController")
            as! Page3ViewController
        page2ViewController = self.storyboard!.instantiateViewController(withIdentifier: "Page2ViewController")
            as! Page2ViewController

        page3ViewController = self.storyboard!.instantiateViewController(withIdentifier: "Page1ViewController")
            as! Page1ViewController
        
        self.setViewControllers([self.page1ViewController],
                                direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)

    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @available(iOS 5.0, *)
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var retVal:UIViewController? = nil
        if viewController == page1ViewController {
            retVal = page2ViewController
        } else if viewController == page2ViewController {
            retVal = page3ViewController
        }
        return retVal
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var retVal:UIViewController? = nil
        if viewController == page3ViewController {
            retVal = page2ViewController
        }else if viewController == page2ViewController {
            retVal = page1ViewController
        }
        return retVal
    }

}

