//
//  PageViewController.swift
//  fithub-swift
//
//  Created by Raymond Torres on 11/10/17.
//  Copyright © 2017 Raymond Torres. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    //create func that returns the obj viewControllerlist gets stored as..
    //cool that you can use functions as obj's like in js
    lazy var viewControllerList:[UIViewController] = {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "DashboardVC");
        let vc2 = sb.instantiateViewController(withIdentifier: "LogsVC");
        let vc3 = sb.instantiateViewController(withIdentifier: "MyAccountVC");
        
        //why doesnt the below code work?
//        let vc1 = DashboardViewController()
//        let vc2 = LogsViewController()
//        let vc3 = MyAccountViewController()
        return [vc1, vc2, vc3]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("app container (page scroll view) loaded...");
        self.dataSource = self
        
        if let firstViewController = viewControllerList.last {
            print("list had a vc")
            self.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else { return nil }
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
    }
}
