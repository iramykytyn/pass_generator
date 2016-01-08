//
//  ViewController.swift
//  Password Generator
//
//  Created by IraM on 12/11/15.
//  Copyright © 2015 IraM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    //MARK: Properties
    @IBOutlet weak var passwordText: UILabel!
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onGeneratePassword(sender: AnyObject) {
        passwordText.text = "Hello Єлисавета"
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
    
}
