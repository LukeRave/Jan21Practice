//
//  ViewController.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardTableView: UITableView!
    @IBOutlet weak var cardNameLabel: UITextField!
    @IBOutlet weak var cardNumLabel: UITextField!
    
    let defaults = UserDefaults.standard
    private var cards = Array<String>()
    private var isAppNotInForeground = false
    private var timeSinceBecameActive = 0
    private var timer: Timer?
    private var backgroundTaskIdentifier: UIBackgroundTaskIdentifier?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//      **for clearing data unless i implement delete later**
//          defaults.set([], forKey: "cardList")
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(resignActive), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleAppWillBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleAppEnterBG), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        isAppNotInForeground = false;
        cardTableView.dataSource = self
        loadCards()
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        guard let cardName = cardNameLabel.text, var cardNum = cardNumLabel.text else { return }
        cardNum = cardNum.replacingOccurrences(of: " ", with: "")
        
        var alertMessage = ""
        
        if !cardNum.isNumeric || cardNum.count != 16 { alertMessage += "Card# can only be numbers and must be 16 digits long." }
        if cardName.isEmpty { alertMessage += " Card must have a name."}
        
        if cardNum.isNumeric && cardNum.count == 16 && cardName != "" && cardNum != "" {
            
        let spacedNum = addSpaceEvery4Nums(to: cardNum)
        let newCellText = "\(cardName): \(spacedNum)"
            
        cards.append(newCellText)
        
        cardNameLabel.text = ""; cardNumLabel.text = ""
        
        defaults.set(cards, forKey: "cardList")
        
        cardTableView.reloadData()
        } else {
            let alert = UIAlertController(title: alertMessage, message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { action in
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func loadCards(){
        
        isAppNotInForeground ? (cards = []) : (cards = defaults.stringArray(forKey: "cardList") ?? [])
        cards = defaults.stringArray(forKey: "cardList") ?? []
        cardTableView.reloadData()
    }
    
    func addSpaceEvery4Nums(to string: String) -> String{
        
        var copy = string;
        for i in 0..<copy.count {
            print("iterating")
            if ((i + 1) % 5) == 0 {
                copy.insert(" ", at: copy.index(copy.startIndex, offsetBy: i))
            }
        }
        return copy
    }
    
    @objc func resignActive(){
        
        print("app resign active")
        
        loadCards()
        
        self.backgroundTaskIdentifier =  UIApplication.shared.beginBackgroundTask(expirationHandler: {
            if let identifier = self.backgroundTaskIdentifier {
                UIApplication.shared.endBackgroundTask(identifier)
            }
        })
        
        //         *Doesn't work because it doesn't return before the app resigns???
        //
        //        DispatchQueue.main.async {
        //            {
        //                if let identifier = self.backgroundTaskIdentifier
        //                {
        //                    UIApplication.shared.endBackgroundTask(identifier)
        //                }
        //            }
        //            isAppNotInForeground = true;
        //
        //        }
        
        DispatchQueue.main.asyncAfter(deadline:.now() + 30)
        {
            if let identifier = self.backgroundTaskIdentifier
            {
                UIApplication.shared.endBackgroundTask(identifier)
            }
        }
        isAppNotInForeground = true;
    }
    
    @objc func handleAppWillBecomeActive(){
        isAppNotInForeground = false
        loadCards()
        timer?.invalidate()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        print("func \(#function) called")
        
    }
    
    @objc func handleAppEnterBG(){
        
        print("func \(#function) called")
    }
    
    @objc func fireTimer() {
        
        let timeRemainingToRunInBG = UIApplication.shared.backgroundTimeRemaining
        
        if self.backgroundTaskIdentifier != nil && timeRemainingToRunInBG <= 30 { print("\(floor(timeRemainingToRunInBG)) seconds remaining in bg")}
        
        if isAppNotInForeground {
            print("app is in background \(timeSinceBecameActive)")
        } else {
            print("app is in foreground \(timeSinceBecameActive)")
        }
        
        timeSinceBecameActive += 1
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.isHidden = isAppNotInForeground
        
        cell.textLabel?.text = cards[indexPath.row]
        
        return cell;
    }
}

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}

