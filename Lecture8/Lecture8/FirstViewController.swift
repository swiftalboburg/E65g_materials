//
//  FirstViewController.swift
//  Lecture8
//
//  Created by Van Simmons on 3/27/17.
//  Copyright © 2017 Harvard University. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var gridView: XView!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var sizeStepper: UIStepper!
    
    var grid: Grid = Grid(GridSize(rows: 3,cols: 3))
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = gridView.gridSize
        grid = Grid(GridSize(rows: size, cols: size))
        gridView.grid = grid
        sizeTextField.text = "\(grid.size.rows)"
        sizeStepper.value = Double(grid.size.rows)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func next(_ sender: Any) {
        grid = gridView.grid as! Grid
        grid = grid.next()
        gridView.grid = grid
        gridView.setNeedsDisplay()
    }
    
    @IBAction func stop(_ sender: Any) {
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0,
            repeats: true
        ) { (t: Timer) in
            self.grid = self.gridView.grid as! Grid
            self.grid = self.grid.next()
            self.gridView.grid = self.grid
            self.gridView.setNeedsDisplay()
        }
    }
    
    //MARK: Button Event Handling
    @IBAction func increaseGridSize(_ sender: Any) {
        let size = gridView.gridSize + 1
        timer?.invalidate()
        timer = nil
        gridView.gridSize = size
        grid = Grid(GridSize(rows: size, cols: size))
        gridView.setNeedsDisplay()
        sizeTextField.text = "\(grid.size.rows)"
    }
    
    @IBAction func decreaseGridSize(_ sender: Any) {
        let size = gridView.gridSize - 1
        timer?.invalidate()
        timer = nil
        gridView.gridSize = size
        grid = Grid(GridSize(rows: size, cols: size))
        gridView.setNeedsDisplay()
        sizeTextField.text = "\(grid.size.rows)"
    }
    
    //MARK: Stepper Event Handling
    @IBAction func step(_ sender: UIStepper) {
        timer?.invalidate()
        timer = nil
        gridView.gridSize = Int(sender.value)
        grid = Grid(GridSize(rows: gridView.gridSize, cols: gridView.gridSize))
        gridView.setNeedsDisplay()
        sizeTextField.text = "\(grid.size.rows)"
    }
    
    //MARK: TextField Event Handling
    @IBAction func editingBegan(_ sender: UITextField) { print("began") }
    @IBAction func editingChanged(_ sender: UITextField) { print("changed") }
    @IBAction func editingEndedOnExit(_ sender: UITextField) {
        print("ended on exit")
        guard let text = sender.text else { return }
        guard let val = Int(text) else {
            showErrorAlert(withMessage: "Invalid value: \(text), please try again.") {
                sender.text = "\(self.gridView.gridSize)"
            }
            return
        }
        gridView.gridSize = val
        grid = Grid(GridSize(rows: val, cols: val))
        gridView.setNeedsDisplay()
    }
    @IBAction func editingEnded(_ sender: UITextField) { print("ended") }
    @IBAction func didTriggerAction(_ sender: UITextField) { print("triggered") }
    
    //MARK: AlertController Handling
    func showErrorAlert(withMessage msg:String, action: (() -> Void)? ) {
        let alert = UIAlertController(
            title: "Alert",
            message: msg,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true) { }
            OperationQueue.main.addOperation { action?() }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

