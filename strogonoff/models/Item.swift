//
//  Item.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/16/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class Item : NSObject, NSCoding {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.calories = aDecoder.decodeDoubleForKey("calories")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeDouble(calories, forKey: "calories")
    }
}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}