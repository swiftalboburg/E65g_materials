//
//  ViewController.swift
//  FinalSection
//
//  Created by Van Simmons on 5/6/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    var textField1Value: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField1.text = "37"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == textField1 {
            if let text = textField.text, let _ = Int(text) {
                return true
            } else {
                textField.text = textField1Value
            }
            return true
        }
        return true
    }
    
    @IBAction func beginEditingTextField1(_ sender: UITextField) {
        if let text = sender.text {
            textField1Value = text
        }
    }
}

