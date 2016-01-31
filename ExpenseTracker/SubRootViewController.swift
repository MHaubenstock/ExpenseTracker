//
//  SubRootViewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/29/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class SubRootViewController : RootViewController
{
    var entity : Entity!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //pageViewController?.setViewControllers([(pageViewController?.viewControllers!.last)!], direction: .Forward, animated: <#T##Bool#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
    static func initializeSubRootViewControllerWithEntity(entity: Entity, storyboard : UIStoryboard) -> SubRootViewController
    {
        let subRootViewController = storyboard.instantiateViewControllerWithIdentifier(Constants.SubRootViewId) as! SubRootViewController
        subRootViewController.entity = entity
        
        return subRootViewController
    }
    
    override func getViewControllersForPageViewController() -> [UIViewController]
    {
        return self.modelController.subRootViewControllersForEntity(entity, storyboard: self.storyboard!)
    }
    
    override func getUIPageViewControllerWithTransitionStyle() -> UIPageViewController
    {
        return UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Vertical, options: nil)
    }
    
    override func getStartingViewController() -> [UIViewController]
    {
        //This will initialize the view controllers, but should only return an array of a single view controller. The one you want to be displayed first
        let viewControllers = getViewControllersForPageViewController()
        return [(viewControllers.last)!]
    }
}