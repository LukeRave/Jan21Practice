//
//  ViewController.swift
//  LocalNotifactions
//
//  Created by Rave Bizz on 2/23/22.
//

import UIKit
import UserNotifications
import MapKit
import CoreLocation



// 1. import UserNotifications'

// 2. create notifaction center


//3. authorize notifications
//  a. create authoriztion options
//  b.call request authorization from notifacation center


//4. create notifaction request
//    a.create notifaction content ( what you notifaction will say)
//    b. create notifaction trigger (date, time, location)
//    c. add request to notifaction center and check for errors

//5. call userNotificationCenter will presnt inside


//6. add  didrecive and  will present function to notifactionCenterDelegete

class ViewController: UIViewController {
    let notificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sendNotification()
 
    }
    
    func sendNotification() {
        // creating content
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "my alert"
        notificationContent.body = "hello you have been alerted"
        notificationContent.badge = NSNumber(value: 3)
        // time trigger
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "testNotification", content: notificationContent,trigger: trigger)
        
        //adding request
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
        
        // date trigger
//
//                let date = DateComponents(calendar: <#T##Calendar?#>, timeZone: <#T##TimeZone?#>, era: <#T##Int?#>, year: <#T##Int?#>, month: <#T##Int?#>, day: <#T##Int?#>, hour: <#T##Int?#>, minute: <#T##Int?#>, second: <#T##Int?#>, nanosecond: <#T##Int?#>, weekday: <#T##Int?#>, weekdayOrdinal: <#T##Int?#>, quarter: <#T##Int?#>, weekOfMonth: <#T##Int?#>, weekOfYear: <#T##Int?#>, yearForWeekOfYear: <#T##Int?#>)
//                let trigger = UNCalendarNotificationTrigger(dateMatching: <#T##DateComponents#>, repeats: <#T##Bool#>)
        
    //location trigger
//
//                let point = CLLocationCoordinate2D(latitude: <#T##CLLocationDegrees#>, longitude: <#T##CLLocationDegrees#>)
//                let region = CLCircularRegion(center: point, radius: 10000, identifier: "notifyRegion")
//                let trigger = UNLocationNotificationTrigger(region: region, repeats: <#T##Bool#>)
        
        
       
    }
}

    
    
    
    
    
    
    
    
    
    
    
    





















