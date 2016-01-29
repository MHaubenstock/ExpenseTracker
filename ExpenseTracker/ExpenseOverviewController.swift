//
//  ExpenseOverviewController.swift
//  ExpenseTracker
//
//  Created by Michael Haubenstock on 1/19/16.
//  Copyright © 2016 Haubensoft, LLC. All rights reserved.
//

import UIKit

class ExpenseOverviewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    //@IBOutlet weak var dataLabel: UILabel!
    //var dataObject: String = ""
    @IBOutlet weak var expenseTable : UITableView!
    
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

        
        
        expenseTable.delegate = self
        expenseTable.reloadData()
    }
    
    //MARK: Table View DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return AppDelegate.expenses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(Constants.ExpenseCellID)! as UITableViewCell
        
        let expense = AppDelegate.expenses[indexPath.row]
        
        cell.textLabel?.text = expense.valueForKey(ExpenseParameters.expenseTitle) as? String
        cell.detailTextLabel?.text = "$\((expense.valueForKey(ExpenseParameters.expenseAmount) as! Float))"

        return cell
    }
}