//
//  list.swift
//  tableView
//
//  Created by Rave Bizz on 1/26/22.
//

import Foundation

struct ListManager {
    static func generateItems() -> [ListItem]{
        var list: [ListItem] = []
        for num in 0...10{
            list.append(ListItem(title: "Number \(num)", description: "Do #\(num) task", status: .inProgress))
        }
        return list
    }
}

struct ListItem {
    var title: String
    var description: String
    let status: ItemStatus
    
    enum ItemStatus: String {
        case repaired
        case inProgress
    }
}
