//
//  Item.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/16/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class Item : Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}