//
//  ViewController.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var creditCardNum: UITextField!
    var sec = 0
    ///UIApplication.didFinishLaunchingNotification -
    ///UIApplication.didBecomeActiveNotification -
    ///UIApplication.willEnterForegroundNotification -
    ///UIApplication.willResignActiveNotification -
    ///UIApplication.didEnterBackgroundNotification -
    ///UIApplication.willTerminateNotification -
    ///UIApplication.userDidTakeScreenshotNotification
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        timer.fire()
        // Do any additional setup after loading the view.
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(resignActive), name: UIApplication.willResignActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(finishedLaunching), name: UIApplication.didFinishLaunchingNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(active), name: UIApplication.didBecomeActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(enteredBG), name: UIApplication.didEnterBackgroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(willTerminate), name: UIApplication.willTerminateNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(screenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
    }
    
    @objc func resignActive(){
        print("App has entered the further")
        UIApplication.shared.beginBackgroundTask(withName: "Searching in the background")
    }
    @objc func finishedLaunching(){
        print("App finished launching")
    }
    @objc func active(){
        print("App is active")
    }
    @objc func enterForeground(){
        print("App moved to the foreground")
    }
    @objc func enteredBG(){
        print("App moved to the background")
    }
    @objc func willTerminate(){
        print("App has been terminated")
    }
    @objc func screenshot(){
        print("Screenshot detected")
    }
    //    UIApplication.didFinishLaunchingNotification
    @objc func fireTimer() -> Int {
        sec += 1
        print("\(sec)")
        return sec
    }
    @IBAction func submit(_ sender: UIButton) {
        
    }
    
}

