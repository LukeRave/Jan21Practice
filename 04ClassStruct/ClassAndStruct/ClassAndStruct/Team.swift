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
        for i in 0..<taskList.count{
            validate(taskNum: i)
        }
    }
    
    func validate(taskNum: Int) {
        for employee in employees {
            if employee.role == taskList[taskNum].roleReq{
                taskList[taskNum].setIsValid(status: true)
                assign(taskNum: taskNum, to: employee)
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        for task in taskList {
            if task.timeReq != 0{
                return false
            }
        }
        return true
    }
    
    func weeksTillComplete() -> Int {
        var workHours: Int = 0
        for task in taskList{
            workHours += task.timeReq
        }
        
        
        
        let weeks = (workHours/40) + 1
        
        return weeks
    }
    

    func printMoney() {
        for task in taskList{
            if task.timeReq != 0{
                print("Tasks not completed")
            }
        }
        print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" )
    }
    
}
