//
//  ViewController.swift
//  ToDoListSwift
//
//  Created by 宣 仁良 on 2014/09/25.
//  Copyright (c) 2014年 宣 仁良. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    @IBOutlet weak var txtItem: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!

    
    var toDoitem: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        if (sender as? NSObject != self.doneButton) {
            return
        }
        
        if(self.txtItem.text.utf16Count > 0) {
            toDoitem = ToDoItem(itemName: self.txtItem.text)
        }
    }
}

