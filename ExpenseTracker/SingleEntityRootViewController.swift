//
//  SingleEntityRootViewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 2/2/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class SingleEntityRootViewController : SubRootViewController
{
    static func initializeSingleEntityRootViewControllerWithEntity(entity: Entity, storyboard : UIStoryboard) -> SingleEntityRootViewController
    {
        
        let singleEntityRootViewController = storyboard.instantiateViewControllerWithIdentifier(Constants.SingleEntityRootViewId) as! SingleEntityRootViewController
        singleEntityRootViewController.entity = entity
        
        return singleEntityRootViewController
    }
    
    override func getViewControllersForPageViewController() -> [UIViewController]
    {
        return self.modelController.singleEntityRootViewControllersForEntity(entity, storyboard: self.storyboard!)
    }
}