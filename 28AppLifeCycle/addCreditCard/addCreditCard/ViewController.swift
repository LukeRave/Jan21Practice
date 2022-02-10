//
//  ViewController.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

class ViewController: UIViewController {

    var cards = Array<Int>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cards.append(1)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(cards[indexPath.row])
        return cell;
    }
    
    
}
