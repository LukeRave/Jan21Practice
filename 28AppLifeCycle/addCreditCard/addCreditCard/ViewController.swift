//
//  ViewController.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cardNameTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var privacyTextView: UITextView!
    var timer: Timer?
    var myCounter = 0
    var isInBackground = false
    private let notificationCenter: NotificationCenter = .default

    // Connect to the corresponding control or the tap recognizer.
    @IBAction func screenBeginTouch(_ sender: Any)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        {
            timer in
            self.myCounter += 1
            if self.isInBackground {
                print("app is in background \(self.myCounter)")
            } else {
                print("app is in foreground \(self.myCounter)")
            }
        }
        notificationCenter.addObserver(self, selector: #selector(handleAppDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleWillResignActive), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(handleDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
//        UIApplication.willResignActiveNotification
//        UIApplication.didEnterBackgroundNotification
//        UIApplication.willTerminateNotification
//        UIApplication.userDidTakeScreenshotNotification
    }

    @objc func handleAppDidBecomeActive() {
        print("func handleAppDidBecomeActive() called")
        self.isInBackground = false
        privacyTextView.isHidden = true
    }
    
    @objc func handleWillEnterForeground() {
        print("func handleWillEnterForeground() called")
        self.isInBackground = false
    }
    
    @objc func handleDidEnterBackground() {
        print("func handleDidEnterBackground() called")
        self.isInBackground = true
    }
    
    @objc func handleWillResignActive() {
        print("app resign active")
        privacyTextView.isHidden = false
    }
}

