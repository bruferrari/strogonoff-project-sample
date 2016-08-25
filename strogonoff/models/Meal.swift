//
//  Meal.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/16/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class Meal {
    let name:String
    let hapiness:Int
    var items = Array<Item>()
    
    init(name:String, hapiness:Int) {
        self.name = name
        self.hapiness = hapiness
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
