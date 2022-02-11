import UIKit

var greeting = "Hello, playground"

class CreditCard {
    var owner: Person?
    
    func numbers(){
        print("123456789")
    }
    deinit {
        print("CreditCard de - init")
    }
}

class Person {
    var cc: CreditCard
    
    init(cc: CreditCard){
        self.cc = cc
    }
    func throwCard(){
        print("*Throws creditcard at a stranger*")
    }
    
    func readCreditCard(){
        cc.numbers()
    }
}

func memoryLeak(){
    let visa = CreditCard()
    DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
        visa.numbers()
    }
}

//Still runs the function eventhough the instance has been erased
memoryLeak()

//No Memory Leak
class newCreditCard {
     var owner: newPerson?
    
    func numbers(){
        print("123456789")
    }
    deinit {
        print("newCreditCard de - init")
    }
}

class newPerson {
    weak var cc: newCreditCard?
    
    init(cc: newCreditCard){
        self.cc = cc
    }
    func throwCard(){
        print("*Throws creditcard at a stranger*")
    }
    
    func readCreditCard(){
        cc?.numbers()
    }
}

func noMemoryLeak(){
    let visa = newCreditCard()
    let john = newPerson(cc: visa)
    visa.owner = john
    
    DispatchQueue.global().asyncAfter(deadline: .now() + 5) { [weak john, unowned visa] in
        print("Beginning of asyncTask")
        visa.owner
        john?.cc?.numbers()
    }
}

//Prints error because the instance has been removed
noMemoryLeak()
