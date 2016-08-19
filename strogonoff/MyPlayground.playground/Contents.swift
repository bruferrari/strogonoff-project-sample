//: Playground - noun: a place where people can play

import UIKit

class Meal {
    var name:String
    var hapiness:Int
    var items = Array<Item>()
    
    init(name:String, hapiness:Int) {
        self.name = name
        self.hapiness = hapiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}

class Item {
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

let meal = Meal(name: "Strogonoff", hapiness: 5);
meal.items.append(Item(name: "Strogonoff", calories: 800))
meal.items.append(Item(name: "Rice", calories: 450))
print(meal.allCalories())




