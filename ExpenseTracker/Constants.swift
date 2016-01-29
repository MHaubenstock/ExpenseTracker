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
    static let OverviewID = "Overview"
    static let EntityAddID = "AddEEntity"
    static let EntityCellID = "ExpenseCell"
    //static let EntityIds = [ExpenseParameters.self, BillParameters.self]
    static let EntityIDs = [Entity(), BillParameters()]
}

class Entity
{
    static let category = "category"
    static let amount = "expenseAmount"
    static let date = "expenseDate"
    static let title = "expenseTitle"
    static let Id = "expenseId"
    static let categories : [String] = ["Groceries", "Entertainment", "Restuarant"]
    
    init(entityName : String, entityCategories)
    {
        
    }
}

/*
class ExpenseParameters
{
    static let category = "category"
    static let amount = "expenseAmount"
    static let date = "expenseDate"
    static let title = "expenseTitle"
    static let Id = "expenseId"
    static let categories : [String] = ["Groceries", "Entertainment", "Restuarant"]
}

class BillParameters
{
    static let category = "category"
    static let expenseAmount = "billAmount"
    static let expenseDate = "billDueDate"
    static let expenseTitle = "billTitle"
    static let expenseId = "billId"
}
*/