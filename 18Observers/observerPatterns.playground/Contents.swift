import UIKit
import WebKit

/// 1. Property observers
var dataArray: [String] = ["original"] {
    didSet {
        print(" DidSet, count: \(dataArray.count)")
    }
    willSet {
        print("WillSet, count: \(dataArray.count), new Value: \(newValue)")
    }
}

dataArray.append("first new item")
dataArray.append("second new item")


/// 2. Key Value Observing (KVO): Observation block
var webView = WKWebView(frame: .zero)
var estimateObservation: NSKeyValueObservation?

estimateObservation = webView.observe(\.estimatedProgress, options: [.old, .new]) { webView, change in
    print("observing estimated NEW progress:", change.newValue ?? "no value")
}

let url = URL(string: "https://google.com")!
webView.load(URLRequest(url: url))

/// No longer required to call invalidate
//estimateObservation?.invalidate()

/// 3. Notification center (NOT push notification)
var loginName = Notification.Name("login")

class AccountViewController {
    func observeForLogin() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogin), name: loginName, object: nil)
    }
    
    @objc func handleLogin(_ notification: Notification) {
        print("EVENT: user is logged in, updating UI...")
        let value = notification.userInfo?["name"] ?? ""
        print("with userInfo: \(value)")
    }
    
    func stopObserving() {
        /// iOS 9.0: no longer required to remove observers
        NotificationCenter.default.removeObserver(self, name: loginName, object: nil)
    }
}

var accountVC: AccountViewController? = AccountViewController()
accountVC?.observeForLogin()
//accountVC = nil

let info = ["name": "texas"]
let noti = Notification(name: loginName, object: nil, userInfo: info)
NotificationCenter.default.post(noti)

//NotificationCenter.default.post(loginSuccess)
//accountVC?.stopObserving()
//NotificationCenter.default.post(loginSuccess)
