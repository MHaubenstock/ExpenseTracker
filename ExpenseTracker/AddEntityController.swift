//
//  AddExpenseController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit
import CoreData

class AddEntityController: UIViewController
{
    @IBOutlet var entityTitle: UITextField!
    @IBOutlet var entityAmount: UITextField!
    @IBOutlet var entityDate: UIDatePicker!
    @IBOutlet var entityCategory: UIPickerView!
    
    var entity : Entity!
    
    static func initializeAddEntityControllerWithEntity(entity: Entity, storyboard : UIStoryboard) -> AddEntityController
    {
        let addEntityController = storyboard.instantiateViewControllerWithIdentifier(Constants.EntityAddId) as! AddEntityController
        addEntityController.entity = entity
        
        return addEntityController
    }
    
    @IBAction func addEntity(sender: UIButton)
    {
        //Add expense to the expense core data store
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext : NSManagedObjectContext! = appDelegate.managedObjectContext
        let entity : NSEntityDescription! = NSEntityDescription.entityForName(Constants.EntityId, inManagedObjectContext: managedContext)
        let expense : NSManagedObject! = NSManagedObject(entity: entity, insertIntoManagedObjectContext: managedContext)
        
        expense.setValue(entityTitle.text, forKey: EntityParameters.title)
        expense.setValue(NSNumber(float: Float(entityAmount.text!)!), forKey: EntityParameters.amount)
        expense.setValue(entityDate.date, forKey: EntityParameters.date)
        //TODO: Still need to flesh out category a bit more
        expense.setValue(self.entity.categories[entityCategory.selectedRowInComponent(0)], forKey: EntityParameters.category)
        expense.setValue(AppDelegate.entities.count + Constants.AddEntityControllerStartingIndex, forKey: EntityParameters.id)
        expense.setValue(self.entity.type, forKey: EntityParameters.type)
        
        do
        {
            //Save the new entity
            try managedContext.save()
            
            //Clear data on page
            entityTitle.text = ""
            entityAmount.text = ""
            entityDate.setDate(NSDate.init(), animated: false)
            //Set category back to default
            
            //Reload entities data
            AppDelegate.setEntitiesArray(AppDelegate.fetchEntityFromManagedObjectContext(Constants.EntityId))
            
            //transition back to overview page
            (self.parentViewController?.parentViewController as! RootViewController).setDefaultStartingViewControllerAsVisibleViewController()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
}