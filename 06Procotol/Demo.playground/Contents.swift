import UIKit

var greeting = "Hello, playground"


/// Extensions

/// Person.swift
struct Person {
    let name: String = ""
    let age: Int = 0
    var location: String = "Dallas"
    private var ssn = 10329403
    
    func work() {
        print(ssn)
    }
}

/// Person+Play.swift
extension Person {
    var getLocation: String {
        return "Welcome to \(location)"
    }
    
    func play() {
        
    }
    func game() {
        print(ssn)
    }
}

let me = Person()
//me.ssn
let you = Person()


extension Person: Equatable {
    
}

if me == you {
    
}

extension String {
    func myCount() -> Int {
        return self.count
    }
}
"asdfasf".myCount()

extension Array {
    func safeIndex(index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}

let value = [1,2,4].safeIndex(index: 4)

/// Protocol
/// Equatable, Comparable, Hashable

extension Person: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
}

extension Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.age < rhs.age
    }
}

var scores: [Person: Int] = [:]
scores[me]

let mySet: Set<Person> = [you, me]
mySet.count


protocol PhoneProtocol {
    func call()
}
struct iPhone: PhoneProtocol {
    func call() {
        
    }
    
    func repair() {
    }
}
struct Owner {
    var phone: PhoneProtocol
    
    init() {
        phone = iPhone()
    }
}
struct Employee {
    var phone: iPhone
    
    init() {
        phone = iPhone()
    }
}

let owner = Owner()
owner.phone.call()
let employee = Employee()
employee.phone.repair()


struct Box {
    var value = 10
    var arr = Array(0...10_000_000)
    mutating func changesValue() {
        value = 12
    }
}

func changeBox(box: inout Box) {
    box.value = 11
}

var myBox = Box()
myBox.value

changeBox(box: &myBox)
myBox.value

myBox.changesValue()
myBox.value

/// Test Driven Development
/// Protocol allows for easier testing

protocol PostProtocol {
    var title: String { get set }
}

protocol UserProtocol {
    func follow(userId: Int)
    func unfollow(userId: Int)
    func getFirstPost() -> PostProtocol
}

protocol SocialMedia {
    var users: [UserProtocol] { get set }
}

//struct User: UserProtocol {
//}

