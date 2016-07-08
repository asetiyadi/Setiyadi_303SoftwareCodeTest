//
//  ListTableViewController.swift
//  CodeTest-303Software
//
//  Created by Andi Setiyadi on 7/6/16.
//  Copyright © 2016 Devhubs. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var modelView = DataModelView()
    var arrPerson = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getList()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPerson.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)
        
        let person = arrPerson[indexPath.row]
        let fullname = "\(person.firstName) \(person.lastName)"
        
        cell.textLabel?.text = fullname
        cell.detailTextLabel?.text = person.city
        
        return cell
    }
    
    
    // MARK: Helper
    
    func getList() {
        modelView.getNameList { [weak self] (success, data) in
            if (success) {
                self?.arrPerson = data
                self?.tableView.reloadData()
            }
            else {
                let alertController = UIAlertController(title: "Ouch!", message: "There is a problem retrieving data", preferredStyle: UIAlertControllerStyle.Alert)

                let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                alertController.addAction(alertAction)
                
                self?.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
}
