//
//  AppDelegate+EntitiesUtilities.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 2/3/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit
import CoreData

extension AppDelegate
{
    // Mark: - Fetching from CoreData
    static func fetchEntityFromManagedObjectContext(entityName : String) -> [NSManagedObject]
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: entityName)
        
        do
        {
            let results = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            return results
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
            return [NSManagedObject]()
        }
    }
    
    static func setEntitiesArray(entities : [NSManagedObject])
    {
        self.entities = entities
    }
    
    static func filteredEntityType(entityType : String) -> [NSManagedObject]
    {
        return AppDelegate.entities.filter({
            (entity : NSManagedObject) -> Bool in return entity.valueForKey(EntityParameters.type) as! String == entityType
        })
    }
    
    static func filteredEntityTypes(entityTypes : [String]) -> [NSManagedObject]
    {
        return AppDelegate.entities.filter({
            (entity : NSManagedObject) -> Bool in return entityTypes.contains((entity.valueForKey(EntityParameters.type) as! String))
        })
    }
    
    static func filteredCategory(category : String, ofEntityType entityType : String) -> [NSManagedObject]
    {
        return filteredEntityType(entityType).filter({
            (entity : NSManagedObject) -> Bool in return entity.valueForKey(EntityParameters.category) as! String == category
        })
    }
    
    static func amountTotal() -> Float
    {
        return amountTotalForEntityArray(AppDelegate.entities)
    }
    
    static func amountTotalForEntityType(entityType : String) -> Float
    {
        return amountTotalForEntityArray(filteredEntityType(entityType))
    }
    
    static func amountTotalForEntityTypes(entityTypes : [String]) -> Float
    {
        return amountTotalForEntityArray(filteredEntityTypes(entityTypes))
    }
    
    static func amountTotalForCategory(category : String, ofEntityType entityType : String) -> Float
    {
        return amountTotalForEntityArray(filteredCategory(category, ofEntityType: entityType))
    }
    
    private static func amountTotalForEntityArray(entityArray : [NSManagedObject]) -> Float
    {
        return entityArray.reduce(0.0, combine: {$0 + ($1.valueForKey(EntityParameters.amount) as! Float)})
    }
    
    // Mark - Static Functions
    static func indexOfEnity(entity : Entity) -> Int
    {
        return Constants.Entities.indexOf(entity) ?? NSNotFound
    }
}