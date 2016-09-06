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
    
    var items = Array<Item>()
    let fileHandler = FileHandler()
    
    let archive = "\(Utils.getActiveUserPath())/strogonoff-items"
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item",
                                            style: UIBarButtonItemStyle.Plain,
                                            target: self,
                                            action: #selector(ViewController.showNewItem))
        navigationItem.rightBarButtonItem = newItemButton
        
        items = fileHandler.read(archive) as! Array
    }
    
    func addNew(item:Item) {
        items.append(item)

        fileHandler.write(items, filePath: archive)
        if let tbView = tableView {
            tbView.reloadData()
        } else {
            Alert(viewController: self).show("An unexpected error ocurred, but item has been added")
        }
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(viewController: self).show()
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
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            if cell.accessoryType == UITableViewCellAccessoryType.None {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(item)
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.None
                if let position = selected.indexOf(item) {
                    selected.removeAtIndex(position)
                } else {
                    Alert(viewController: self).show()
                }
            }
        } else {
            Alert(viewController: self).show()
        }
     }
    
    func getMealFromForm() -> Meal? {
        if nameField == nil || hapinessField == nil {
            return nil
        }
        
        let name = nameField!.text
        let hapiness = Int32(hapinessField!.text!)
        
        if hapiness == nil {
            return nil
        }
        
        let meal = Meal(name: name!, hapiness: hapiness!)
        meal.items = selected
        
        print("eaten: \(meal.name) \(meal.hapiness)")
        for item in meal.items {
            print(item.name, item.calories)
        }
        return meal

    }
    
    @IBAction func add() {
        if let meal = getMealFromForm() {
            if let meals = delegate {
                meals.add(meal)
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(viewController: self).show("An unexpected error ocurred, but the meal has been added")
                }
                return
            }
        }
        
        Alert(viewController: self).show()

       }
}
