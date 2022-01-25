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
        var bestEmployee: Employee;
        for employee in employees {
            if employee.role == taskList[taskNum].roleReq {
                bestEmployee = employee;
                taskList[taskNum].setIsValid(status: true)
                self.assign(taskNum: taskNum, to: bestEmployee)
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        var thisTask = taskList[taskNum]
        employee.attempt(task: &thisTask)
    }
    
    func allTasksCompleted() -> Bool {
        if weeksTillComplete() == 0 {
            return true
        }
        else {return false}
    }
    
    func weeksTillComplete() -> Int {
        var timeDict: [Role: Int] = [:]
        var weeksNeeded = 0;
        for item in taskList {
            if let taskRoleTime = timeDict[item.roleReq] {
                timeDict[item.roleReq] = taskRoleTime + item.timeReq;
            }
            else {timeDict[item.roleReq] = item.timeReq}
        }
        for key in timeDict.keys {
            var tempWeeksNeeded = 0;
            let employeesByRole = employees.filter { $0.role == key};
            var totalTimeThisWeek = 0;
            employeesByRole.forEach {
               totalTimeThisWeek += (40 - $0.hoursWorked)
            }
            let timeAvailable = employeesByRole.count * 40 - totalTimeThisWeek
            let thisKey = timeDict[key] ?? -1
            if timeDict.values.max() == 0 {
                continue
            } else if timeAvailable >= thisKey{
                if weeksNeeded <= 0{
                    weeksNeeded = 0
                }
            }
            else {
                tempWeeksNeeded = Int(ceil(Double(thisKey - timeAvailable) / 40.0))
                if tempWeeksNeeded > weeksNeeded{
                    weeksNeeded = tempWeeksNeeded
                }
                print(timeAvailable, thisKey)
            }
        }
        return weeksNeeded
    }

    func printMoney() {
        if allTasksCompleted(){
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        }
        else {print("Tasks not completed")}
    }
    
}
