//
//  AddExpenseController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit
import CoreData

class AddBillController: UIViewController
{
    @IBOutlet var expenseTitle: UITextField!
    @IBOutlet var expenseAmount: UITextField!
    @IBOutlet var expenseDate: UIDatePicker!
    @IBOutlet var expenseCategory: UIPickerView!
    
    var categories : [String] = ["Entertainment", "Recreation", "Utilities"]
    
    @IBAction func addExpense(sender: UIButton)
    {
        //Add expense to the expense core data store
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext : NSManagedObjectContext! = appDelegate.managedObjectContext
        let entity : NSEntityDescription! = NSEntityDescription.entityForName(Constants.ExpenseEntityID, inManagedObjectContext: managedContext)
        let expense : NSManagedObject! = NSManagedObject(entity: entity, insertIntoManagedObjectContext: managedContext)
        
        print("BLAH: \(expenseAmount.text!)")
        expense.setValue(expenseTitle.text, forKey: ExpenseParameters.expenseTitle)
        expense.setValue(NSNumber(float: Float(expenseAmount.text!)!), forKey: ExpenseParameters.expenseAmount)
        expense.setValue(expenseDate.date, forKey: ExpenseParameters.expenseDate)
        expense.setValue(categories[expenseCategory.selectedRowInComponent(0)], forKey: ExpenseParameters.category)
        expense.setValue(AppDelegate.expenses.count + 1, forKey: ExpenseParameters.expenseId)
        
        do
        {
            try managedContext.save()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}