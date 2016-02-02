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
    override func getViewControllersForPageViewController() -> [UIViewController]
    {
        return self.modelController.subRootViewControllersForEntity(entity, storyboard: self.storyboard!)
    }
}