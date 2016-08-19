//
//  NewItemViewController.swift
//  strogonoff
//
//  Created by Bruno Ferrari on 8/18/16.
//  Copyright © 2016 Bruno Ferrari. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate {
    func addNew(item:Item)
}

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var caloriesField:UITextField?
    var delegate:AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        
        let name = nameField!.text!
        let calories = NSString(string: caloriesField!.text!).doubleValue
        
        let item = Item(name: name, calories: calories)
        if delegate == nil {
            return
        }
        delegate!.addNew(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
        
    }

}
