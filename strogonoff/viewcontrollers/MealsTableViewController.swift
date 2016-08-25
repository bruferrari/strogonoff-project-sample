//
//  MealsTableViewController.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/16/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {

    var meals = [Meal(name: "eggplant brownie", hapiness: 3),
                Meal(name: "zucchini muffin", hapiness: 5)]
    
    func add(meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func showDetails(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as! UITableViewCell
            if let index = tableView.indexPathForCell(cell)?.row {
                
                let meal = getMealOnLongPress(cell)
                
                if let m = meal {
                    showDetailsAlert(m, index: index)
                }
            }
        }
    }
    
    func showDetailsAlert(meal: Meal, index: Int) {
        RemoveMealController(controller: self).show(meal, handler: {
            action in
            self.meals.removeAtIndex(index)
            self.tableView.reloadData()
        })
    }
    
    func getMealOnLongPress(cell:UITableViewCell) -> Meal? {
        let indexPath = tableView.indexPathForCell(cell)
        if indexPath == nil {
            return nil
        }
        let row = indexPath!.row
        return meals[row]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(MealsTableViewController.showDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
}
