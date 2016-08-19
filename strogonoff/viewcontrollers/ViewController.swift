//
//  ViewController.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/15/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal:Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var hapinessField:UITextField?
    @IBOutlet var tableView:UITableView?
    var delegate:AddAMealDelegate?
    
    var items = [Item(name: "eggplant brownie", calories: 10),
                 Item(name: "Zuchinni Muffin", calories: 10),
                 Item(name: "Cookie", calories: 10),
                 Item(name: "Coconut Oil", calories: 500),
                 Item(name: "Chocolate frosting", calories: 1000),
                 Item(name: "Chocolate chip", calories: 1000)]
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item",
                                            style: UIBarButtonItemStyle.Plain,
                                            target: self,
                                            action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func addNew(item:Item) {
        items.append(item)
        
        if tableView == nil {
            return
        }
        
        tableView!.reloadData()
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    var selected = Array<Item>()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil {
            return
        }
        let item = items[indexPath.row]
        if cell!.accessoryType == UITableViewCellAccessoryType.None {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let position = selected.indexOf(item) {
                selected.removeAtIndex(position)
            }
        }
     }
    
    @IBAction func add() {
        if nameField == nil || hapinessField == nil {
            return
        }
        
        let name = nameField!.text
        let hapiness = Int(hapinessField!.text!)
        
        if hapiness == nil {
            return
        }
        
        let meal = Meal(name: name!, hapiness: hapiness!)
        meal.items = selected
        
        print("eaten: \(meal.name) \(meal.hapiness)")
        for item in meal.items {
            print(item.name, item.calories)
        }
        
        if delegate == nil {
            return
        }
        
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}

