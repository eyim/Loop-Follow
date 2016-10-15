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
    
    
    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        application.registerUserNotificationSettings(
            UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound],
                categories: nil))
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        let settings = NSBundle.mainBundle().remoteSettings, AzureMobileURL=settings?["AzureMobileServiceURL"], AzureMobileKey=settings?["AzureMobileServiceAppKey"]
        
        let sharedClient = MSClient(applicationURLString: AzureMobileURL, applicationKey: AzureMobileKey)

        sharedClient.push?.registerNativeWithDeviceToken(deviceToken, tags: nil, completion: {(error) -> Void in
            
            if error != nil{
                NSLog("Error registering for notifications: %@", error)
            }
            
        })
    }
    func application(application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Failed to register for remote notifications: ", error.description)
    }
    
    func application(application: UIApplication,
                     didReceiveRemoteNotification userInfo: [NSObject: AnyObject]) {
        
        print(userInfo)
        
        let apsNotification = userInfo["aps"] as? NSDictionary
        let apsString       = apsNotification?["alert"] as? String
        
        let alert = UIAlertController(title: "Alert", message: apsString, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { _ in
            print("OK")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { _ in
            print("Cancel")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        var currentViewController = self.window?.rootViewController
        while currentViewController?.presentedViewController != nil {
            currentViewController = currentViewController?.presentedViewController
        }
        
        currentViewController?.presentViewController(alert, animated: true) {}
        
    }
    

}

