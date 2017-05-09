//
//  ModalViewController.swift
//  Lecture14
//
//  Created by Van Simmons on 5/8/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var resizingBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        widthConstraint.constant = 200
        heightConstraint.constant = 200
        UIView.animate(
            withDuration: 2.0, animations: {
                self.dismissButton.alpha = 1.0
                self.view.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.8)
                self.resizingBox.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 1.0, alpha: 0.2)
                self.view.layoutIfNeeded()
            },
            completion: { completed in
                UIView.transition(
                    with: self.textBox,
                    duration: 2.0,
                    options: UIViewAnimationOptions.transitionCrossDissolve,
                    animations: { self.textBox.textColor = UIColor.white },
                    completion: nil
                )                
            }
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        UIView.animate(
            withDuration: 2.0, animations: {
                self.view.alpha = 0.0
        },
            completion: { completed in
                self.dismiss(animated: false) { }
            }
        )
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
