//
//  ToDoItem.swift
//  ToDoListSwift
//
//  Created by 宣 仁良 on 2014/09/25.
//  Copyright (c) 2014年 宣 仁良. All rights reserved.
//

import Foundation

class ToDoItem {
    var itemName : String = ""
    var compeleted : Bool = false
    var createdAt : NSDate?
    
    init(){}
    
    init(itemName : String) {
        self.itemName = itemName
    }
    
    func toggleTaskStatus() {
        self.compeleted = (!self.compeleted)
    }
}