//
//  MainTableViewController.swift
//  11-Deleting-And-Rearanging
//
//  Created by vmalikov on 5/26/16.
//  Copyright © 2016 justForFun. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, DataEnteredDelegate {

    let cellIdentifier = "movieCellIdentifier"
    var dataSource = ["Iron Man", "Ratatouille", "The Matrix", "Office Space", "Shaoline Soccer"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Movies"

        navigationItem.leftBarButtonItem = editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddNewItem" {
            if let destination = segue.destinationViewController as? AddItemViewController {
                destination.delegate = self
            }

        }
    }

    func userDidAddNewItem(newItem: String) {
        dataSource.append(newItem)
        tableView.reloadData()
    }

    // MARK: - TableView editing section

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            dataSource.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let item = dataSource.removeAtIndex(sourceIndexPath.row)
        dataSource.insert(item, atIndex: destinationIndexPath.row)
    }
}

extension MainTableViewController {

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        if let textLabel = cell.textLabel {
            textLabel.text = dataSource[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
}
