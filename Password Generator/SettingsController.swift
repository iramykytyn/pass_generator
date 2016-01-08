//
//  Password Generator
//
//  Created by IraM on 12/11/15.
//  Copyright © 2015 IraM. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController, UITextFieldDelegate{
    
    //MARK: Actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Properties
    @IBOutlet weak var memoriable: UISwitch!
    @IBOutlet weak var customized: UISwitch!
    @IBOutlet weak var passLength: UISlider!
    @IBOutlet weak var includeChar: UISwitch!
    @IBOutlet weak var specialSymb: UISwitch!
    
}
