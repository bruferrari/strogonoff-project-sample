//
//  FileWriter.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 9/6/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import Foundation

class FileHandler {
    
    func write(object: AnyObject, filePath: String) -> Bool {
        return NSKeyedArchiver.archiveRootObject(object, toFile: filePath).boolValue
    }
    
    func read(filePath: String) -> AnyObject? {
        if let result = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) {
            return result
        }
        return nil
    }
}