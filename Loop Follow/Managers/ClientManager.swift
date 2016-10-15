//
//  ClientManager.swift
//  Loop Follow
//
//  Created by ali on 9/19/16.
//  Copyright © 2016 Ali Mazaheri. All rights reserved.
//

import Foundation

class ClientManager {
    //static let settings = NSBundle.mainBundle().remoteSettings
    
    static let sharedClient = MSClient(applicationURLString: "https://nightscoutalert.azure-mobile.net", applicationKey: "xdyJRCthnIuMViGOsaoLuPJvSPjufs82")
}
