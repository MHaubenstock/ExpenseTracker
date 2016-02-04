//
//  GlobalRootViewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 2/2/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class GlobalRootViewController : SubRootViewController
{
    static func initializeGlobalRootViewControllerWithEntity(storyboard : UIStoryboard) -> GlobalRootViewController
    {
        let globalRootViewController = storyboard.instantiateViewControllerWithIdentifier(Constants.GlobalRootViewId) as! GlobalRootViewController
        
        return globalRootViewController
    }
    
    override func getViewControllersForPageViewController() -> [UIViewController]
    {
        return self.modelController.globalRootViewControllers(self.storyboard!)
    }
}