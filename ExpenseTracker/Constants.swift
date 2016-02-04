//
//  Constants.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import Foundation

class Constants
{
    static let AddEntityControllerStartingIndex = 1
    static let GlobalSettingsId = "GlobalSettings"
    static let OverviewId = "Overview"
    static let EntityAddId = "AddEntity"
    static let GlobalRootViewId = "GlobalRootView"
    static let SingleEntityRootViewId = "SingleEntityRootView"
    static let EntityCellId = "EntityCell"
    static let EntityId = "Entity"
    
    static let Bill = Entity(entityType: "Bill", entityCategories: ["Entertainment", "Recreation", "Utilities"])
    static let Expense = Entity(entityType: "Expense", entityCategories: ["Entertainment", "Groceries", "Restaurant"])
    static let Entities = [Bill, Expense]
}