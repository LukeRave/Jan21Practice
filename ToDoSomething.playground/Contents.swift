import Foundation

struct TodoList {
    var todoList: [TodoItem]
    init() {
        self.todoList = []
    }
    mutating func addTodoItem(newTitle: String, newDescription: String, newPriority: Int) {
        self.todoList.append(TodoItem(title: newTitle, description: newDescription, priority: newPriority))
    }
    mutating func removeTodoItem(removeIdx: Int) {
        self.todoList.remove(at: removeIdx)
    }
    func queryTaskByStatus(queryStatus: String) -> Int {
        var count = 0
        self.todoList.forEach {
            if $0.status == queryStatus {
                count += 1
            }
        }
        return count
    }
    func filterTaskAfterDateCreated(queryDate: Date) -> [TodoItem] {
        return self.todoList.filter {$0.dateCreated > queryDate}
    }
    
}

struct TodoItem {
    let statusOptions = ["Open", "InProgress", "Pending", "Closed"]
    var title: String
    var description: String
    var dateCreated: Date
    var status: String
    var priority: Int
    var completed: [String:Any]
    init(title: String, description: String, priority: Int) {
        self.title = title
        self.description = description
        self.dateCreated = Date()
        self.status = "Open"
        self.priority = priority
        self.completed = ["completed": false, "dateComplete": Date()]
    }
    mutating func updateDescription(description: String) {
        self.description = description
    }
    mutating func appendDescription(description: String) {
        self.description += description
    }
    mutating func updateStatus(status: String) {
        if statusOptions.contains(status) {
            self.status = status
        }
    }
    mutating func decrementPrio() {
        if self.priority <= 10 {
            self.priority += 1
        }
    }
    mutating func incrementPrio() {
        if self.priority > 1 {
            self.priority -= 1
        }
    }
    mutating func completeTask() {
        self.completed = ["completed": true, "dateComplete": Date()]
        self.status = "Closed"
    }
}
