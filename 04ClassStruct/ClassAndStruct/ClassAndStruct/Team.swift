//
//  Team.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

/**
 3) Team: Manages employees and tasks
 •  Properties:
 - employees: [Employee]
 - taskList: [Task]
 • Functions
 - add(employee:)
     • adds an employee to employees array
 - add(task:)
     • adds a task to taskList
 - startWeek()
     • simulates a 40 hour work week
     • go thru team's taskList and call validate(taskNum:)
 - validate(taskNum:)
     • check if team member has roleReq
     • set task property isValid to true if valid
     • call assign(task:to) for the first appropriate employee on the team
 - assign(task: to)
     • calls employee attempt(task:)
 - weeksTillComplete(task:) -> Int
     • returns number of weeks required for the current team to complete all tasks
     •  should consider number of valid employee and their current hours worked
     •  can be called before startWeek and after startWeek
 - printMoney() should print "BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" if all tasks are completed
     •  else print "Tasks not completed"
 
 */

class Team {
    var employees: [Employee] = []
    var taskList: [Task] = []
    func add(employee: Employee) {
        employees.append(employee)
    }
    func add(task: Task) {
        taskList.append(task)
    }
    func startWeek() {
        for (index, _) in taskList.enumerated() {
            validate(taskNum: index)
        }
    }
    func validate(taskNum: Int) {
        let rolemap = employees.filter {$0.role == taskList[taskNum].roleReq}
        if !rolemap.isEmpty {
            taskList[taskNum].setIsValid(status: true)
            self.assign(taskNum: taskNum, to: rolemap[0])
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        var output = true
        taskList.forEach {!$0.isComplete ? output = false : print("do nothing")}
        
        return output
    }
    
    func weeksTillComplete() -> Int {
        let reqRolemap = taskList.map {$0.roleReq}
        var output: Int = 0
        for reqRole in Set(reqRolemap) {
            let requiredHours = taskList.filter {$0.roleReq == reqRole}.reduce(0, {agg, ele in agg + ele.timeReq})
            let nEmployees = employees.filter {$0.role == reqRole}.count
            while requiredHours > (40 * nEmployees * output) {
                output += 1
            }
        }
        return output
    }

    func printMoney() {
        if self.allTasksCompleted() {
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        } else {
            print("Tasks not completed")
        }
    }
    
}
