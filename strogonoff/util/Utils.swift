//
//  Utils.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 9/6/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class Utils {
    
    static func getActiveUserPath() -> String {
        let userDirs = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        
        return userDirs[0] as String
    }
    
}