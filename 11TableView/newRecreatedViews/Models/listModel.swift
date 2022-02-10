//
//  listModel.swift
//  tableViews
//
//  Created by Cameryn Williams on 2/6/22.
//

import Foundation

struct listManager {
    static func generateItems() -> [ListItem] {
        var list: [ListItem] = []
        for num in 0...10 {
            list.append(ListItem(number: num, title: "Title of Task", description: "Do #\(num) task", status: .inProgress ))
        }
        return list
    }
}

struct ListItem {
    var number: Int
    var title: String
    var description: String
    var status: ItemStatus
    
    enum ItemStatus: String {
    case completed
    case inProgress
    }
}
