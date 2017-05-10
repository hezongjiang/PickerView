//
//  ViewController.swift
//  Test
//
//  Created by he on 2017/5/8.
//  Copyright © 2017年 he. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {
    
    fileprivate var context: JSContext?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = PickerView.pickerView(textField: textField, titles: ["1", "2", "3"]) { (_) in
            
        }
        
        let _ = PickerView.timePickerView(textField: textField2) { (_) in
            
        }
    }
    
    @IBAction func click(_ sender: UIBarButtonItem) {
    }

    
}

