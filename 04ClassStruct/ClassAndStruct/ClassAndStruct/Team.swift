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
        for i in 0...taskList.count-1 {
            validate(taskNum: i)
        }
    }
    
    func validate(taskNum: Int) {
        for member in employees {
            if member.role == taskList[taskNum].roleReq {
                taskList[taskNum].isValid = true
                assign(taskNum: taskNum, to: member)
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        taskList.allSatisfy({$0.isComplete == true}) ? true : false
    }
    
    func weeksTillComplete() -> Int {
        var totalHours: Int = 0
        for i in 0...taskList.count-1 {
            totalHours += taskList[i].timeReq
        }
        if totalHours % 40 != 0 {
            return (totalHours / 40) + 1
        } else {
            return totalHours / 40
        }
    }

    func printMoney() {
        if allTasksCompleted() {
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        } else {
            print("Tasks not completed")
        }
    }
}
