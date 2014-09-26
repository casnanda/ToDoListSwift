//
//  ToDoListViewController.swift
//  ToDoListSwift
//
//  Created by 宣 仁良 on 2014/09/25.
//  Copyright (c) 2014年 宣 仁良. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController , UITableViewDataSource{
    var toDoitems: [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadInitialData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoitems.count
    }
    
    /*
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    XYZToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    return cell;
    }
*/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cellId = "ListPrototypeCell"
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellId,forIndexPath: indexPath) as UITableViewCell
        
        var toDoItem = self.toDoitems[indexPath.row]
        cell.textLabel?.text = toDoItem.itemName
        
        if (toDoItem.compeleted) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None;
        }
        return cell as UITableViewCell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var toDoItem = self.toDoitems[indexPath.row]
        toDoItem.toggleTaskStatus()
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        
    }
    
    //- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        println("back to the List View");
        //XYZAddToDoItemViewController *source = [segue sourceViewController];
        var sourceViewControl = segue.sourceViewController as AddToDoItemViewController
        if(sourceViewControl.toDoitem != nil) {
            self.toDoitems.append(sourceViewControl.toDoitem!)
            self.tableView.reloadData()
        }
    }
    
    
    
    func loadInitialData() {
        var item1 = ToDoItem(itemName: "Call Mike")
        toDoitems.append(item1)
        
        var item2 = ToDoItem(itemName: "Open Meeting")
        toDoitems.append(item2)
        
    }
}