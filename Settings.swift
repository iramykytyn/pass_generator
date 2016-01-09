//
//  Settings.swift
//  Password Generator
//
//  Created by IraM on 1/9/16.
//  Copyright © 2016 IraM. All rights reserved.
//

import Foundation

class Settings {
    class var sharedInstance: Settings{
        struct Preferences {
            static var instance: Settings?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Preferences.token) {
            Preferences.instance = Settings()
        }
        
        return Preferences.instance!
    }
    
    var Length = 6
    var Memoriable:Bool = true
    var Special:Bool = true
    var Character:Bool = true

}