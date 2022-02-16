import UIKit


/// Delegation Pattern
protocol GetDataProtocol {
    func getData(input: String)
}

class ObjecOne {
    var delegate: GetDataProtocol?
}

class ObjectTwo: GetDataProtocol {
    func getData(input: String) {
        print("getting data from old Object")
    }
    
    func somethingTwo() {
        
    }
}

class ObjectThree: GetDataProtocol {
    func getData(input: String) {
        print("getting data from new Object")
    }
    
    func somethingThree() {
        
    }
}

/// File 1
let vc = ObjecOne()
vc.delegate = ObjectTwo()

/// File 2
vc.delegate?.getData(input: "user input")


protocol BookDelegate {
    func getPage(pageNum: Int) -> String
    func addPage(page: String)
}

class BookData: BookDelegate {
    var pages = ["page 1", "page 2", "page 3", "page 4", "page 5", "page 6"]
    
    func getPage(pageNum: Int) -> String {
        return pages[pageNum]
    }
    
    func addPage(page: String) {
        pages.append(page)
    }
    
    func destroyBook() {
        pages = []
    }
    
}

class BookView {
    var bookDelegate: BookDelegate?
    func printPage(at pageNum: Int) {
        if let bookDelegate = bookDelegate {
            let result = bookDelegate.getPage(pageNum: pageNum)
            print(result)
        }
    }
}

let bookDelegate = BookData()

var bookView = BookView()
bookView.bookDelegate = bookDelegate
bookView.printPage(at: 2)

/// Passing data by using delegation pattern to separate reponsibilities
/// Example: The BookView is concerned only with visuals and does not manages the data
