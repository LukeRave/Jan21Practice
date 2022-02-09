//
//  TodoManager.swift
//  tables
//
//  Created by Luat on 1/26/22.
//

import Foundation

struct ToDoManager {
    static func createSomeItems() -> [ToDoItem] {
        var list: [ToDoItem] = []
        for num in 0...10 {
            list.append(ToDoItem(title: "work #\(num)", status: .inProgress))
        }
        return list
    }
}


struct ToDoItem {
    let title: String
    let status: ItemStatus
    
    enum ItemStatus: String {
        case done
        case inProgress
    }
}
