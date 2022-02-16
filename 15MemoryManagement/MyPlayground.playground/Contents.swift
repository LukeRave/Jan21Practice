import UIKit

var greeting = "Hello, playground"

/// value types: stored in the current context

func something() {
    var myNum = 10
    myNum = 11
}

something()

/// reference type: class, closures
class Company {
    var ceo: Employee?
    func paid() {
        print("get paid")
    }
    deinit {
        print("Company de - init")
    }
}

class Employee {
    /// Use weak or unowned to tell ARC not to increase ref count
    unowned var company: Company
    
    init(company: Company) {
        self.company = company
    }
    func getPaid() {
        company.paid()
    }
    /// Deinit happens when the Ref Count == 0
    deinit {
        print("Employee de - init")
    }
}


/// ARC: automatic reference counting
func classSomething() {
    print("starting classSomething")
    let dunkins = Company()
    DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
        dunkins.paid()
    }
}

//classSomething()

/// Memory Leak / Retainn cycle / Strong reference cycle
func memoryLeakTest() {
    print("start memoryLeakTest")
    let dunkins = Company()
    /// Class Employee
    /// unowned company: Company
    let bob = Employee(company: dunkins)
    dunkins.ceo = bob
    
    DispatchQueue.global().asyncAfter(deadline: .now() + 5) { [weak bob, unowned dunkins] in
        print("start of asyncTask")
        dunkins
        bob?.company.paid()
    }

}

memoryLeakTest()

/// Create with memory Leak
/// Fix memory leak
class Person {
    var cc: CreditCard
}

class CreditCard {
    var owner: Person
}


