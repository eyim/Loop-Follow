//
//  AppDelegate.swift
//  Loop Follow
//
//  Created by ali on 9/19/16.
//  Copyright © 2016 Ali Mazaheri. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        application.registerUserNotificationSettings(
            UIUserNotificationSettings(types: [.alert, .badge, .sound],
                categories: nil))
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let settings = Bundle.main.remoteSettings, AzureMobileURL=settings?["AzureMobileServiceURL"]
        
       // let sharedClient = MSClient(applicationURLString: AzureMobileURL, applicationKey: AzureMobileKey)
 let sharedClient = MSClient(applicationURLString: AzureMobileURL!)
        sharedClient.push?.registerDeviceToken(deviceToken, completion: {(error) -> Void in
            
            if error != nil{
                NSLog("Error registering for notifications: %@", error.debugDescription)
            }
            
        })
    }
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: ", error.localizedDescription)
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        
        print(userInfo)
        
        let apsNotification = userInfo["aps"] as? NSDictionary
        let apsString       = apsNotification?["alert"] as? String
        
        let alert = UIAlertController(title: "Alert", message: apsString, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("OK")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            print("Cancel")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        var currentViewController = self.window?.rootViewController
        while currentViewController?.presentedViewController != nil {
            currentViewController = currentViewController?.presentedViewController
        }
        
        currentViewController?.present(alert, animated: true) {}
        
    }
    

}

