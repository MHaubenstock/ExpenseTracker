//
//  EntityOverviewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class EntityOverviewController : UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var entityTable : UITableView!
    @IBOutlet weak var totalLabel : UILabel!
    @IBOutlet weak var remainingFundsLabel : UILabel!
    
    var entities : [Entity]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        entityTable.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        totalLabel.text = "Total: $\(AppDelegate.amountTotalForEntityTypes(entityTypesArrayForEntities()))"
        remainingFundsLabel.text = "Remaining: $\(AppDelegate.getRemainingFunds())"
        
        loadData()
    }
    
    static func initializeEntityOverviewControllerWithEntities(entities: [Entity], storyboard : UIStoryboard) -> EntityOverviewController
    {
        let entityOverviewController = storyboard.instantiateViewControllerWithIdentifier(Constants.OverviewId) as! EntityOverviewController
        entityOverviewController.entities = entities
        
        return entityOverviewController
    }
    
    func loadData()
    {
        entityTable.reloadData()
    }
    
    //MARK: Table View DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return entities.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return entities[section].type
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AppDelegate.filteredEntityType(entities[section].type).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.EntityCellId)! as UITableViewCell
        
        //This is inefficient
        let entity = AppDelegate.filteredEntityType(entities[indexPath.section].type)[indexPath.row]
        
        cell.textLabel?.text = entity.valueForKey(EntityParameters.title) as? String
        cell.detailTextLabel?.text = "$\((entity.valueForKey(EntityParameters.amount) as! Float))"

        return cell
    }
    
    // MARK: Helper Functions
    func entityTypesArrayForEntities() -> [String]
    {
        return entities.map{ (entity) -> String in return entity.type }
    }
}