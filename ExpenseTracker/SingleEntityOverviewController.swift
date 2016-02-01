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
        
        entityTable.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        totalLabel.text = "Total: $\(AppDelegate.amountTotalForEntityType(entity.type))"
        
        
        loadData()
    }
    
    static func initializeSingleEntityOverviewControllerWithEntity(entity: Entity, storyboard : UIStoryboard) -> SingleEntityOverviewController
    {
        let singleEntityOverviewController = storyboard.instantiateViewControllerWithIdentifier(Constants.SingleEntityOverviewId) as! SingleEntityOverviewController
        singleEntityOverviewController.entity = entity
        
        return singleEntityOverviewController
    }
    
    func loadData()
    {
        entityTable.reloadData()
    }
    
    //MARK: Table View DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return Constants.Entities[AppDelegate.indexOfEnity(entity)].type
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //Could be more efficient
        let count = AppDelegate.filteredEntityType(Constants.Entities[AppDelegate.indexOfEnity(entity)].type).count
        
        return count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.EntityCellId)! as UITableViewCell
        
        //This is inefficient
        let entity = AppDelegate.filteredEntityType(Constants.Entities[AppDelegate.indexOfEnity(self.entity)].type)[indexPath.row]
        
        cell.textLabel?.text = entity.valueForKey(EntityParameters.title) as? String
        cell.detailTextLabel?.text = "$\((entity.valueForKey(EntityParameters.amount) as! Float))"
        
        return cell
    }
}