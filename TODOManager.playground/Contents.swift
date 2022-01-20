import UIKit

struct TODOItem: Equatable {
    var title: String
    var message: String
    var day: String
    var done: Bool
    var show: Bool
}

struct TODOManager {
    var todoItems: [TODOItem]
    var repeatable: [Bool]
    var daysRepeated: [[Bool]]
    var todoItemsRepeated: [[TODOItem]]
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    init(todoItems: [TODOItem]) {
        self.todoItems = todoItems
        var rep: [Bool] = []
        for _ in 0..<todoItems.count {
            rep.append(false)
        }
        self.repeatable = rep
        var daysRep: [[Bool]] = []
        for _ in 0..<todoItems.count {
            var days: [Bool] = []
            for _ in 0..<7 {
                days.append(false)
            }
            daysRep.append(days)
        }
        self.daysRepeated = daysRep
        self.todoItemsRepeated = []
    }
    
    mutating func setRepeatable(todoItem: TODOItem) {
        let index = todoItems.firstIndex(of: todoItem)
        if let ind = index {
            repeatable[ind] = true
        }
    }
    
    mutating func setDaysRepeated(todoItem: TODOItem, daysRepeated: [Bool]) {
        let index = todoItems.firstIndex(of: todoItem)
        if let ind = index {
            if repeatable[ind] {
                self.daysRepeated[ind] = daysRepeated
                var todoItemsList: [TODOItem] = []
                var todoItemCopy = todoItem
                todoItemCopy.done = false
                for (ind2,b) in daysRepeated.enumerated() {
                    todoItemCopy.day = daysOfWeek[ind2]
                    if b {
                        todoItemCopy.show = true
                    } else {
                        todoItemCopy.show = false
                    }
                    todoItemsList.append(todoItemCopy)
                }
                self.todoItemsRepeated[ind] = todoItemsList
            }
        }
    }
}
