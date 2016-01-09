//
//  Password Generator
//
//  Created by IraM on 12/11/15.
//  Copyright © 2015 IraM. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController, UITextFieldDelegate{
    
    
    //MARK: Properties
    @IBOutlet weak var memoriable: UISwitch!
    @IBOutlet weak var includeChar: UISwitch!
    @IBOutlet weak var specialSymb: UISwitch!
    @IBOutlet weak var lengthTF: UITextField!
    
    let settings = Settings.sharedInstance
    
    //MARK: Actions
    override func viewDidLoad() {
        print("Enter viewDidLoad")
        super.viewDidLoad()
        lengthTF.delegate = self
        lengthTF.keyboardType = UIKeyboardType.NumberPad
        lengthTF.text = String(self.settings.Length)
    
        memoriable.on = NSUserDefaults.standardUserDefaults().boolForKey("memoriable")
        specialSymb.on = NSUserDefaults.standardUserDefaults().boolForKey("specialSymb")
        includeChar.on = NSUserDefaults.standardUserDefaults().boolForKey("includeChar")
        memoriable.on = self.settings.Memoriable
        specialSymb.on = self.settings.Special
        includeChar.on = self.settings.Character
    }
    

    @IBAction func onMemoriableSwitch(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(memoriable.on, forKey: "memoriable")
        self.settings.Memoriable = memoriable.on
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func onCharSwitchChanged(sender: AnyObject) {
        print("Enter onCharSwitchChanged")
        NSUserDefaults.standardUserDefaults().setBool(includeChar.on, forKey: "includeChar")
        self.settings.Character = includeChar.on
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func onSpecSymblSwitchChanged(sender: AnyObject) {
        print("Enter onSpecSymblSwitchChanged")
        NSUserDefaults.standardUserDefaults().setBool(specialSymb.on, forKey: "specialSymb")
        self.settings.Special = specialSymb.on
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    

    @IBAction func onEnter(sender: AnyObject) {
        if(lengthTF.text != ""){
            self.settings.Length = Int(lengthTF.text!)!
        } else {
            lengthTF.text?.append(Character(UnicodeScalar(self.settings.Length)))
        }
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField (textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == lengthTF {
            let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789").invertedSet
            let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
                
            let resultingStringLengthIsLegal = prospectiveText.characters.count <= 2
            
            let textFieldNumberRange = Int(textField.text!)
            
            //let resultingStringRangeIsLegal = textFieldNumberRange >= 4 //&& (textFieldNumberRange < 10 ))
            result = replacementStringIsLegal && resultingStringLengthIsLegal //&& resultingStringRangeIsLegal//&& resultingTextIsNumeric
        }
        return result
    }

}
