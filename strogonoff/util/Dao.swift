//
//  Dao.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 9/27/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class Dao {
    
    let mealsArchive:String
    let itemsArchive:String
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        
        let dir = userDirs[0] as String
        mealsArchive = "\(dir)/strogonoff-meals"
        itemsArchive = "\(dir)/strogonoff-items"
    }
    
    func saveMeals(meals:Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
    }
    
    func saveItems(items:Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as! Array
        }
        return Array<Meal>()
    }
    
    func loadItems() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as! Array
        }
        return Array<Item>()
    }
}
