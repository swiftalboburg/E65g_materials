//
//  ViewController.swift
//  Lecture12
//
//  Created by Van Simmons on 4/24/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

//let weatherURL = "http://api.openweathermap.org/data/2.5/weather?q=boston,%20ma&appid=77e555f36584bc0c3d55e1e584960580"
let finalProjectURL = "https://dl.dropboxusercontent.com/u/7544475/S65g.json"

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func fetch(_ sender: UIButton) {
        let fetcher = Fetcher()
        fetcher.fetchJSON(url: URL(string:finalProjectURL)!) { (json: Any?, message: String?) in
            guard message == nil else {
                print(message ?? "nil")
                return
            }
            guard let json = json else {
                print("no json")
                return
            }
            print(json)
            let resultString = (json as AnyObject).description
            let jsonArray = json as! NSArray
            let jsonDictionary = jsonArray[0] as! NSDictionary
            let jsonTitle = jsonDictionary["title"] as! String
            let jsonContents = jsonDictionary["contents"] as! [[Int]]
            print (jsonTitle, jsonContents)
            OperationQueue.main.addOperation {
                self.textView.text = resultString
            }
        }
    }
}

