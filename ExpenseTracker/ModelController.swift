//
//  ModelController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

import UIKit

class ModelController: NSObject, UIPageViewControllerDataSource {

    var viewControllers : [UIViewController]!

    override init() {
        super.init()
        // Create the data model.
    }

    func rootViewControllers(storyboard: UIStoryboard) -> [UIViewController]!
    {
        if viewControllers == nil
        {
            viewControllers = [EntityOverviewController.initializeEntityOverviewControllerWithEntities(Constants.Entities, storyboard: storyboard)] + Constants.Entities.map { (entity) -> SubRootViewController in
                return SubRootViewController.initializeSubRootViewControllerWithEntity(entity, storyboard: storyboard)
            }
        }
        
        return viewControllers
    }
    
    func subRootViewControllersForEntity(entity : Entity, storyboard: UIStoryboard) -> [UIViewController]!
    {
        if viewControllers == nil
        {
            viewControllers = [AddEntityController.initializeAddEntityControllerWithEntity(entity, storyboard: storyboard), EntityOverviewController.initializeEntityOverviewControllerWithEntities([entity], storyboard: storyboard)]
        }
        
        return viewControllers
    }

    func indexOfViewController(viewController: UIViewController) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
        return viewControllers.indexOf(viewController) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return viewControllers[index]
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.viewControllers.count {
            return nil
        }
        return viewControllers[index]
    }

}

