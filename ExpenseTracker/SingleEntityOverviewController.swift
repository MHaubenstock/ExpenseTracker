//
//  SingleEntityOverviewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/29/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import Foundation

//
//  EntityOverviewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class SingleEntityOverviewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var entityTable : UITableView!
    @IBOutlet weak var totalLabel : UILabel!
    
    var entity : Entity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        totalLabel.text = String(AppDelegate.amountTotalForEntityType(entity.type))
        
        entityTable.delegate = self
        entityTable.reloadData()
    }
    
    static func initializeSingleEntityOverviewControllerWithEntity(entity: Entity, storyboard : UIStoryboard) -> SingleEntityOverviewController
    {
        let singleEntityOverviewController = storyboard.instantiateViewControllerWithIdentifier(Constants.SingleEntityOverviewId) as! SingleEntityOverviewController
        singleEntityOverviewController.entity = entity
        
        return singleEntityOverviewController
    }
    
    //MARK: Table View DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return Constants.Entities.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return Constants.Entities[section].type
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let count = AppDelegate.filteredEntityType(Constants.Entities[section].type).count
        
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.EntityCellId)! as UITableViewCell
        
        //This is inefficient
        let entity = AppDelegate.filteredEntityType(Constants.Entities[indexPath.section].type)[indexPath.row]
        
        cell.textLabel?.text = entity.valueForKey(EntityParameters.title) as? String
        cell.detailTextLabel?.text = "$\((entity.valueForKey(EntityParameters.amount) as! Float))"
        
        return cell
    }
}