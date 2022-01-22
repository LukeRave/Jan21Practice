//
//  ViewController.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Tester().reduceDistanceKeepPriority(array: [8, 6, 2, 4])
        print("#", createCounter(string: "aa bb c"))
    }
    func createCounter(string: String) -> [Character: Int] {
        var count: [Character: Int] = [:];
        // Creates a new array including the space
        let arr = Array(string)
        let newArr = Set(arr)
        
        //Populates the dictionary without the duplicates
        for element in newArr {
            if element == " "{
                continue
            }else{
            count[element] = 0
            }
        }
        
        //iterates through the original array and increments the dict value if there's a dup
        for element in arr {
            if element == " "{
                continue
            }else{
            count[element]! += 1
            }
        }
        
        return count
    }
}

