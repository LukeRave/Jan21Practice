import UIKit

import SwiftUI


let date = Date()
let dateFormatter = DateFormatter()
func timeAsString() -> String {
    dateFormatter.dateFormat = "dd/MM/yyyy"
    print(dateFormatter.string(from: date))
    return dateFormatter.string(from: date)
}

class toDo {
    var list: [String] = [];
    var id: Int;
    var description: String;
    var status = "Incomplete";
    var createdTime: String = timeAsString();
    var finishTime: String;
    
    init (id: Int, description: String, finishTime: String) {
        self.id = id;
        self.description = description;
        self.finishTime = finishTime;
        list.append(description)
    }
    
    func markComplete() {
        status = "Complete"
    }
    
    func changeDescription(newDesc: String){
        description = newDesc;
    }
    func checkIfPastDue(){
        if Int(timeAsString())! > Int(createdTime)!{
            status = "Past Due"
        }
    }
}

let getCoffee = toDo(id: 1, description: "I need coffee", finishTime: "1:00PM")
let goHome = toDo(id: 2, description: "Go home and do more work", finishTime: "5:00PM")

getCoffee.markComplete()



