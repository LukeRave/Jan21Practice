//
//  ToDoList.swift
//  App Practice
//
//  Created by Rave Bizz on 1/20/22.
//

import Foundation

protocol Addable {
    mutating func addTask(task: String)
}

struct ToDoList: Equatable, Addable {
    var list:[String] = []
    
    mutating func addTask(task: String){
        list.append(task)
    }
    
    func printList(){
        print(list)
    }
    mutating func removeTask(num: Int){
        list.remove(at: num)
    }
    func checkTasks(task: String) -> Bool {
        return
            list.contains(task)
    }
    
}

var myToDoList: ToDoList = ToDoList()
//list: ["Make the Breakfast", "Eat the Breakfast", "Be the Breakfast"])
