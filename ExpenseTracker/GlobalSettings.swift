//
//  GlobalSettings.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 2/3/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import Foundation

class GlobalSettings
{
    // MARK: Generic Settings Public Variables
    static var MonthlyBudget : Float
    {
        set
        {
            GlobalSettings.saveGlobalSetting(newValue, key: GlobalSettings.MonthlyBudgetKey)
        }
        get
        {
            return GlobalSettings.loadGlobalSetting(GlobalSettings.MonthlyBudgetKey, defaultValue: GlobalSettings.MonthlyBudgetDefaultValue) as! Float
        }
    }
    
    static var MonthlySavings : Float
    {
        set
        {
            GlobalSettings.saveGlobalSetting(newValue, key: GlobalSettings.MonthlySavingsKey)
        }
        get
        {
            return GlobalSettings.loadGlobalSetting(GlobalSettings.MonthlySavingsKey, defaultValue: GlobalSettings.MonthlySavingsDefaultValue) as! Float
        }
    }
    
    // MARK: Generic Getter and Setter functions
    private static func loadGlobalSetting(key : String, defaultValue : AnyObject) -> AnyObject
    {
        let settingValue = NSUserDefaults.standardUserDefaults().objectForKey(key)
        
        if (settingValue != nil)
        {
            return settingValue!
        }
        else
        {
            return defaultValue
        }
    }
    
    private static func saveGlobalSetting(value : AnyObject, key : String)
    {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
    }
    
    // MARK: Global Settings Default Values
    private static let MonthlyBudgetDefaultValue = 0.00
    private static let MonthlySavingsDefaultValue = 0.00
    
    // MARK: Global Settings Constants Keys
    private static let MonthlyBudgetKey = "MonthlyBudget"
    private static let MonthlySavingsKey = "MonthlySavings"
}