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
    @IBOutlet var monthlySavingsLabel : UILabel!
    @IBOutlet var monthlySavingsValueLabel : UILabel!
    @IBOutlet var monthlySavingsSlider : UISlider!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        monthlyBudgetField.text = String(GlobalSettings.MonthlyBudget)

        monthlySavingsSlider.minimumValue = 0.0
        monthlySavingsSlider.maximumValue = GlobalSettings.MonthlyBudget
        monthlySavingsSlider.value = GlobalSettings.MonthlySavings
        monthlySavingsValueLabel.text = String(monthlySavingsSlider.value)
        
        monthlySavingsSlider.addTarget(self, action: Selector("monthlySavingsSliderDidUpdate:"), forControlEvents: .ValueChanged)
    }
    
    static func initializeGlobalSettingsController(storyboard : UIStoryboard) -> GlobalSettingsController
    {
        let globalSettingsController = storyboard.instantiateViewControllerWithIdentifier(Constants.GlobalSettingsId) as! GlobalSettingsController
        
        return globalSettingsController
    }
    
    @IBAction func saveGlobalSettings(sender : UIButton)
    {
        print("Save Global Settings")
        
        GlobalSettings.MonthlyBudget = Float(monthlyBudgetField.text!)!
        GlobalSettings.MonthlySavings = monthlySavingsSlider.value
    }
    
    func monthlySavingsSliderDidUpdate(sender : UISlider)
    {
        //at least there are no values with three digits. Make the decimal 2 digits
        //no wifi right now, so can't search for example
        monthlySavingsValueLabel.text = String(Float(Int(monthlySavingsSlider.value * 100)) / 100.0)
    }
}
