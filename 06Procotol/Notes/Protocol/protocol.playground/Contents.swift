import UIKit

protocol PhoneProtocol {
    var number: String { get }
    func makeCall()
}

protocol SmartPhoneProtocol {
    func downloadApp(app: String)
}

protocol CombinedProtocol: PhoneProtocol, SmartPhoneProtocol {
    
}

struct iPhone: CombinedProtocol {
    var number: String
    
    func makeCall() {
        print("making iphone call")
    }
    
    func downloadApp(app: String) {
        /// Some networking call
        print("downloading app from AppStore")
    }

    func useIMessage() {
        print("using iMessage")
    }
}

struct AndroidPhone: CombinedProtocol {
    
    var number: String
    
    func makeCall() {
        print("Making android call")
    }
    
    func downloadApp(app: String) {
        print("downloading app from PlayStore")
    }

    func upgradeStorage() {
        print("updating to 256 BG")
    }
}

let iPhone8 = iPhone(number: "123-123-1234")
let galaxyS8 = AndroidPhone(number: "456-456-4567")
iPhone8.makeCall()
galaxyS8.makeCall()

let phones: [SmartPhoneProtocol] = []

for phone in phones {
    phone.downloadApp(app: "angry bird")

    if let phone = phone as? iPhone {
        phone.useIMessage()
    } else if let phone = phone as? AndroidPhone {
        phone.upgradeStorage()
    }
}

struct Person {
    let phone: SmartPhoneProtocol
    
    func searchForApp(name: String) {
        phone.downloadApp(app: name)
    }
}

struct PhoneMock: SmartPhoneProtocol {
    func downloadApp(app: String) {
        print("no need for networking, we can fake some data here")
    }
    
    func makeCall() {
        print("nothing here")
    }
}


/// Dependency Injection
/// Using protocol as the TYPE, we can create any object that conforms the the protocol, and pass that object to the object we're testing
let phoneMock = PhoneMock()

let bob = Person(phone: iPhone8)
let tim = Person(phone: galaxyS8)
let al = Person(phone: phoneMock)
al.searchForApp(name: "Angry birds")
/// Al does not have a real phone, he has a mock phone that can be used for testing

/// 1. Depending on a protocol (more abstract, flexible)
///     - remove tightly coupled dependency
/// 2. Actual implementation of iPhone/Android phone is not required (de-coupled) to create a Person that owns a SmartPhoneProtocol



/// Abstraction:
protocol TeacherProtocol {
    func answerQuestion(num: Int) -> Bool
}
/// Protocol used to abstract some methods but not all methods
/// Expose only the method that is needed while hiding other methods
/// Aka. Delegation pattern

struct Student {
    var teacher: TeacherProtocol?
    var grade: Int = 0
    
    func askQuestion() {
        if let answer = teacher?.answerQuestion(num: 42),
           answer == true {
            print("answer given true")
        } else {
            print("default value here")
        }
    }
}

struct Teacher: TeacherProtocol {
    var students = Array(repeating: Student(), count: 3)
    
    func answerQuestion(num: Int) -> Bool {
        if num == 42 {
            return true
        } else {
            return false
        }
    }
    
    mutating func assignGrade(index: Int, grade: Int) {
        students[index].grade = grade
    }
}

let teacher = Teacher()
var bobby = Student()
bobby.teacher = teacher
bobby.askQuestion()
bobby.teacher?.answerQuestion(num: 10)
/// Student can use methods from teacher's struct: answerQuestion(num:) but
/// student can't use gradePaper, that method is not exposed by the TeacherProtocol
//bobby.teacher?.gradePaper(index: 0, grade: 100)
