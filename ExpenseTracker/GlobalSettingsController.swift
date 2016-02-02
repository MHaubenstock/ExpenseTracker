//
//  GlobalSettingsController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 2/2/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class GlobalSettingsController : UIViewController
{
    @IBOutlet var viewTitleLabel : UILabel!
    @IBOutlet var monthlyBudgetLabel : UILabel!
    @IBOutlet var monthlyBudgetField : UITextField!
    
    static func initializeGlobalSettingsControllerWithEntity(entity: Entity, storyboard : UIStoryboard) -> GlobalSettingsController
    {
        let globalSettingsController = storyboard.instantiateViewControllerWithIdentifier(Constants.GlobalSettingsId) as! GlobalSettingsController
        
        return globalSettingsController
    }
    
    @IBAction func saveGlobalSettings(sender : UIButton)
    {
        print("Save Global Settings")
    }
}