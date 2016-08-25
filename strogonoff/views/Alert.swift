//
//  Alert.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/23/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import UIKit

class Alert {
    
    let viewController:UIViewController
    
    init(viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func show(message:String = "Unexpected error") {
        let alert = UIAlertController(title: "Sorry", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(ok)
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
    
}
