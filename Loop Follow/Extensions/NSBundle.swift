//
//  NSBundle.swift
//  Loop
//
//  Created by Nate Racklyeft on 7/28/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation

extension Bundle {
    var shortVersionString: String! {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    fileprivate var remoteSettingsPath: String? {
        return Bundle.main.path(forResource: "RemoteSettings", ofType: "plist")
    }
    
    var remoteSettings: [String: String]? {
        guard let path = remoteSettingsPath else {
            return nil
        }
        
        return NSDictionary(contentsOfFile: path) as? [String: String]
    }
}
