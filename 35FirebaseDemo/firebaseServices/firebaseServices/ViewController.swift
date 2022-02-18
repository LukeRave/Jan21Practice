//
//  ViewController.swift
//  firebaseServices
//
//  Created by Luat on 9/2/21.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBAction func handleCreateItem(_ sender: Any) {
        guard
            let fieldOne = topTextField.text,
            let fieldTwo = Int(bottomTextField.text ?? "0")
        else {
            return
        }
        createItem(productName: fieldOne, price: fieldTwo)

    }
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBAction func createUser(_ sender: Any) {
        guard
            let fieldOne = emailTextField.text,
            let fieldTwo = passwordTextfield.text
        else {
            return
        }
        createNewUser(email: fieldOne, password: fieldTwo)
    }
    @IBAction func signInUser(_ sender: Any) {
        guard
            let fieldOne = emailTextField.text,
            let fieldTwo = passwordTextfield.text
        else {
            return
        }
        signIn(email: fieldOne, password: fieldTwo)
    }
    @IBAction func signOut(_ sender: Any) {
        signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingButton()
        getRemoteConfig()
        updateColor()
    }

    /// 1. Firebase Realtime Database
    func createItem(productName: String, price: Int) {
//        DispatchQueue.global()
        let ref = Database.database().reference()
        ref.child("users/" + productName).setValue([
            "email": price,
        ])
    }
    
    /// 2. Crashlytics
    func addingButton() {
        
        let crashButton = UIButton(type: .roundedRect)
        crashButton.frame = CGRect(x: 20, y: 500, width: 100, height: 30)
        crashButton.setTitle("Test Crash", for: [])
        crashButton.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(crashButton)
    }
    
    /// Cause a crash when button is pressed
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [1,2,3]
        let _ = numbers[100] // Generating array out of bounds error
    }
    
    /// 3. Remote Config
    var remoteConfig: RemoteConfig!
    
    func getRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
//        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        remoteConfig.fetch { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                self.remoteConfig.activate { changed, error in
                    
                    if changed == true {
                        print("new remote configs values")
                    } else {
                        print("no new changes to remote config")
                    }
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
        
    }
    
    func updateColor() {
        print("updating color")
        let featureOne = remoteConfig.configValue(forKey: "featureOne")
        if let color = featureOne.stringValue {
            
            print("current config color: \(color)")
            switch color {
            case "blue":
                DispatchQueue.main.async {
                    self.view.backgroundColor = .cyan
                }
            case "red":
                DispatchQueue.main.async {
                    self.view.backgroundColor = .red
                }
            case "white":
                DispatchQueue.main.async {
                    self.view.backgroundColor = .white
                }
            default:
                DispatchQueue.main.async {
                    self.view.backgroundColor = .white
                }
            }
        }
    }
    
    /// 4. Firebase Auth
    /// Sign Up new Users
    func createNewUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print("creating new user with :\(email)")
        }
    }
    
    /// Sign in existing Users
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
        }
    }
    
    /// Sign out
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    /// Setting up observers for signed in state (if you  need to react to change in signed in state)
    var handle: AuthStateDidChangeListenerHandle?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /// Attach the listener in the view controller's viewWillAppear method:
        print("setting up observers for signed In state")
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if user == nil {
                self.view.backgroundColor = .systemPink
                print("user is signed OUT")
            } else {
                self.view.backgroundColor = .purple
                print("user is signed IN")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /// And detach the listener in the view controller's viewWillDisappear method:
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}

