//
//  Meal.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/16/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class Meal : NSObject, NSCoding{
    let name:String
    let hapiness:Int32
    var items = Array<Item>()
    
    init(name:String, hapiness:Int32) {
        self.name = name
        self.hapiness = hapiness
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.hapiness = aDecoder.decodeIntForKey("hapiness")
        self.items = aDecoder.decodeObjectForKey("items") as! Array
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeInt(hapiness, forKey: "hapiness")
        aCoder.encodeObject(items, forKey: "items")
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
    
    func details() -> String {
        var msg = "Hapiness \(hapiness)"
        for item in items {
            msg += "\n \(item.name) - \(item.calories) calories"
        }
        return msg
    }
}
