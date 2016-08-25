//
//  RemoveMealController.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/25/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(meal: Meal, handler: ((UIAlertAction!) -> Void)) {
        let details = UIAlertController(title: meal.name,
                                        message: meal.details(),
                                        preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.Destructive, handler: handler)
        
        details.addAction(remove)
        details.addAction(cancel)
        
        controller.presentViewController(details, animated: true, completion: nil)

    }
    
}
