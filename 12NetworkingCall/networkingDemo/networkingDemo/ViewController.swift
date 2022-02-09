//
//  ViewController.swift
//  networkingDemo
//
//  Created by Luat on 1/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBAction func handleUpdate(_ sender: Any) {
        print("tapped")
        guard let url = URL(string: addyStr) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("no data from network call")
                return
            }
//            print(data)
            self.decodeMyData(data: data)
        }

        task.resume()
        print("end of handle Tap action")
    }
    
    let addyStr = "https://hn.algolia.com/api/v1/items/1"

    override func viewDidLoad() {
        super.viewDidLoad()
        Foo.shared.doSomething()
    }
    
    func decodeMyData(data: Data) {
        do {
            let model = try JSONDecoder().decode(NewsModel.self, from: data)
            print(model)
            DispatchQueue.main.async {
                self.topLabel.text = model.title
            }
            DispatchQueue.global().async {
                var num = 0
                for ele in 0...10_000_000 {
                    num += ele
                }
                print("num ==== \(num)")
            }
        } catch {
            // decoding error
            
            print(error)
        }
        
    }


}

class Foo {
    static let shared = Foo()
    
    func doSomething() {
        
    }
}
