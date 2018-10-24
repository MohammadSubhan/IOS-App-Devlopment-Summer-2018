//
//  ViewController.swift
//  Calculator App
//  Created by Mohammad Subhan on 6/23/18.
//  Copyright © 2018 Mohammad Subhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variable to differentiate recent calculation and new number input
    static var input = false
    
    //Variable to hold operation type
    static var operation: String = ""
    
    //Variables to hold numbers for operation
    static var first: String = ""
    static var second: String = ""
    
    //Output display
    @IBOutlet weak var LabelDisplay: UILabel!
    
    //Button functions
    @IBAction func clearPressed(_ sender: Any) {
        LabelDisplay.text = ""
        ViewController.input = true
        ViewController.first = ""
        ViewController.second = ""
    }
    @IBAction func plusMinusPressed(_ sender: Any){
        if(LabelDisplay.text != "") {
            if (LabelDisplay.text?.contains("-"))! {
                let a: Int = (LabelDisplay.text?.count)! - 1
                LabelDisplay.text = String(LabelDisplay.text!.suffix(a))
            }
            else {
                LabelDisplay.text = "-" + LabelDisplay.text!
            }
        }
    }
    @IBAction func zeroPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "0"
    }
    @IBAction func onePressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "1"
    }
    @IBAction func twoPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "2"
    }
    @IBAction func threePressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "3"
    }
    @IBAction func fourPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "4"
    }
    @IBAction func fivePressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "5"
    }
    @IBAction func sixPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "6"
    }
    @IBAction func sevenPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "7"
    }
    @IBAction func eightPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "8"
    }
    @IBAction func ninePressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        LabelDisplay.text! += "9"
    }
    @IBAction func decimalPressed(_ sender: Any) {
        if(ViewController.input == false){
            LabelDisplay.text = ""
            ViewController.input = true
        }
        
        //Onlyn one decimal allowed and if its first make it "0.###"
        if(LabelDisplay.text == "") {
            LabelDisplay.text! += "0."
        }
        else if (LabelDisplay.text?.contains("."))!{
            LabelDisplay.text! += ""
        }
        else {
            LabelDisplay.text! += "."
        }
    }
    
    
    //Operation buttons
    //Need a function to use for all operations
    //Have variables which hold the operation type, and the first and second number to use operation on
    @IBAction func plusPressed(_ sender: Any) {
        //Check if current input should be the first or second number
        if(ViewController.first == "") {
            ViewController.first = LabelDisplay.text!
            ViewController.input = false
        }
        else {
            ViewController.second = LabelDisplay.text!
            //Now we have both numbers do the previous operation
            doOperation()
            //Now take output of the previous operation and make it the first of this new one
            ViewController.first = LabelDisplay.text!
        }
        //Changes operation to add
        ViewController.operation = "add"
    }
    @IBAction func minusPressed(_ sender: Any) {
        if(ViewController.first == "") {
            ViewController.first = LabelDisplay.text!
            ViewController.input = false
        }
        else {
            ViewController.second = LabelDisplay.text!
            doOperation()
            ViewController.first = LabelDisplay.text!
        }
        ViewController.operation = "subtract"
    }
    @IBAction func multiplyPressed(_ sender: Any) {
        if(ViewController.first == "") {
            ViewController.first = LabelDisplay.text!
            ViewController.input = false
        }
        else {
            ViewController.second = LabelDisplay.text!
            doOperation()
            ViewController.first = LabelDisplay.text!
        }
        ViewController.operation = "multiply"
    }
    @IBAction func dividePressed(_ sender: Any) {
        if(ViewController.first == "") {
            ViewController.first = LabelDisplay.text!
            ViewController.input = false
        }
        else {
            ViewController.second = LabelDisplay.text!
            doOperation()
            ViewController.first = LabelDisplay.text!
        }
        ViewController.operation = "divide"
    }
    @IBAction func modPressed(_ sender: Any) {
        if(ViewController.first == "") {
            ViewController.first = LabelDisplay.text!
            ViewController.input = false
        }
        else {
            ViewController.second = LabelDisplay.text!
            doOperation()
            ViewController.first = LabelDisplay.text!
        }
        ViewController.operation = "mod"
    }
    
    //Equals
    @IBAction func equalsPressed(_ sender: Any) {
        //Only do anything if a first number and operation already exists
        if(ViewController.first != "" && ViewController.operation != "") {
            //Take current input as the second number
            ViewController.second = LabelDisplay.text!
            //Do the operation
            doOperation()
        }
    }
    
    
    //Function for operations
    func doOperation() {
        if(ViewController.first == "" || ViewController.second == "") {
            //Do nothing
        }
        else {
            let a: Double = Double(ViewController.first)!
            let b: Double = Double(ViewController.second)!
            switch ViewController.operation {
                
            case "add":
                let c = round((a + b) * 10000000000) / 10000000000
                LabelDisplay.text = String(c)
                
            case "subtract":
                let c = round((a - b) * 10000000000) / 10000000000
                LabelDisplay.text = String(c)
            
            case "multiply":
                let c = round((a * b) * 10000000000) / 10000000000
                LabelDisplay.text = String(c)
                
            case "divide":
                let c = round((a / b) * 10000000000) / 10000000000
                LabelDisplay.text = String(c)
            
            case "mod":
                let c = round((a.truncatingRemainder(dividingBy: b)) * 10000000000) / 10000000000
                LabelDisplay.text = String(c)
            
            default:
                break
            }
            
            ViewController.first = ""
            ViewController.second = ""
            ViewController.input = false
            ViewController.operation = ""
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

