//
//  ViewController.swift
//  Password Generator
//
//  Created by IraM on 12/11/15.
//  Copyright © 2015 IraM. All rights reserved.
//

//  TO IMPLEMENT
/*  1. Memoiable password
    2. Password range in TextField
    3. Share button -> to copy pass + send by mail
*/

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: Global Varaibles
    let settings = Settings.sharedInstance
    
    
    //MARK: Properties
    @IBOutlet weak var passwordText: UILabel!
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settings.Character = true
        self.settings.Length = 6
        self.settings.Memoriable = true
        self.settings.Special = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onGeneratePassword(sender: AnyObject) {
        passwordText.text = GeneratePassword()
    }
    @IBAction func onShare(sender: AnyObject) {
        //let firstActivityItem = passwordText.text
        let activityViewController = UIActivityViewController(activityItems: [passwordText.text! as NSString], applicationActivities: nil)
       
        activityViewController.excludedActivityTypes = [
            UIActivityTypePostToWeibo,
            UIActivityTypePrint,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo
        ]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
    @IBAction func onStop(sender: AnyObject) {
        passwordText.text = nil
    }
    
    func GeneratePassword() -> String {
    var passwordStr = String()
    var length = self.settings.Length
        if (self.settings.Special && self.settings.Character == true) {
            repeat {
                switch arc4random_uniform(3) {
                case 0:
                    passwordStr += genChar()
                case 1:
                    passwordStr += genNumb()
                case 2:
                    passwordStr += genSpec()
                default:
                    passwordStr += genNumb()
                    print("Something went wrong!")
                }
                length -= 1
            } while (length > 0)
        } else {
            if (self.settings.Character == true) {
                repeat {
                    if arc4random_uniform(2) == 0 {
                        passwordStr += genChar()
                    } else {
                        passwordStr += genNumb()
                    }
                    length -= 1
                } while (length > 0)
            } else {
                repeat {
                    passwordStr += genNumb()
                    length -= 1
                } while (length > 0)
            }
        }
        
        return passwordStr
    }
    
    func genNumb() -> String {
        var numbStr = ""
        let number = 48 + Int(arc4random_uniform(UInt32(57 - 48 + 1)))
        numbStr.append(Character(UnicodeScalar(number))) // += number as Character
        return numbStr
    }
    
    func genChar() -> String {
        var charSymb = ""
        let number = 65 + Int(arc4random_uniform(UInt32(90 - 65 + 1)))
        charSymb.append(Character(UnicodeScalar(number)))
        if (arc4random_uniform(2) == 1) {
            return charSymb.lowercaseString
        } else {
            return charSymb
        }
    }
    
    func genSpec() -> String {
        var passwordStr = ""
        let number = 35 + Int(arc4random_uniform(UInt32(38 - 35 + 1)))
        passwordStr.append(Character(UnicodeScalar(number))) // += number as Character
        return passwordStr
    }
    
    func getRandNoun() -> String {
        var noun = String()
        
        
        
        return noun
        
    }
    
    func getRandAdjective() -> String {
        var adjective = String()
        
        return adjective
    }
    
}
