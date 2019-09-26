//
//  ViewController.swift
//  my basic calculator
//
//  Created by Andrew Tran on 9/24/19.
//  Copyright © 2019 Andrew Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    var history = [String]()
    var previousNumber:Double = 0
    var currentNumber:Double = 0
    var operation = 0
    var operatorButtonPress = false
    var equalButtonPress = false
    
    // MARK: Actions
    @IBAction func numberButton(_ sender: UIButton) {
        
        // check for new number input
        if(operatorButtonPress == true){
            //empty display
            displayLabel.text = String(sender.tag)
            historyLabel.text! += String(sender.tag)
            //save display to variable
            if(displayLabel.text != "" ){
                currentNumber = Double(displayLabel.text!)!
                
            }
            operatorButtonPress = false
        }else if(equalButtonPress == true){
            // when equal button was pressed
            // clear display and history on new number press
            displayLabel.text = ""
            historyLabel.text = ""
            equalButtonPress = false
            
            // append new number
            displayLabel.text = String(sender.tag)
            historyLabel.text! += String(sender.tag)
        }else{
            // concatonate numbers for display and history
            displayLabel.text! += String(sender.tag)
            historyLabel.text! += String(sender.tag)
            
            // save the number for operations
            currentNumber = Double(displayLabel.text!)!
        }
    }
    
    @IBAction func operatorButton(_ sender: UIButton) {
        
        // check if display is not empty and button pressed isnt equal
        if(displayLabel.text != "" && sender.tag != 13){
            // if operator button is clicked
            // save number
            previousNumber = Double(displayLabel.text!)!
            // append to history label
            if(sender.tag == 17){
                // divide
                historyLabel.text! += " / "
            }else if(sender.tag == 16){
                // multiply
                historyLabel.text! += " x "
            }else if(sender.tag == 15){
                // subtract
                historyLabel.text! += " - "
            }else if(sender.tag == 14){
                // addition
                historyLabel.text! += " + "
            }
            
            //operator button was pressed
            operatorButtonPress = true
            
            // save operation for when user presses equals
            operation = sender.tag
            
        }else if(sender.tag == 13){
            // equal button
            historyLabel.text! += " = "
            // do operations
            if(operation == 17){
                // divide
                currentNumber = previousNumber / currentNumber
            }else if(operation == 16){
                // multiply
                currentNumber = previousNumber * currentNumber
            }else if(operation == 15){
                // subtract
                currentNumber = previousNumber - currentNumber
            }else if(operation == 14){
                // add
                currentNumber = previousNumber + currentNumber
            }
            historyLabel.text! += String(currentNumber)
            displayLabel.text = String(currentNumber)
            operation = 0
            
            // save into history
            history.append(historyLabel.text!)
            
            equalButtonPress = true
        }
        
    }
    
    @IBAction func signChangeButton(_ sender: UIButton) {
        currentNumber = 0 - currentNumber
        displayLabel.text = String(currentNumber)
    }
    
    
    @IBAction func instantOperations(_ sender: UIButton) {
        if(sender.tag == 24){
            // percentage
            currentNumber = currentNumber / 100
        }else if(sender.tag == 23){
            // square root
            currentNumber = currentNumber.squareRoot()
        }else if(sender.tag == 22){
            // squared
            currentNumber *= currentNumber
        }else if(sender.tag == 21){
            // reciprical
            currentNumber = 1 / currentNumber
        }
        // replace label for display
        displayLabel.text = String(currentNumber)
        
    }
    
    @IBAction func eraseButton(_ sender: UIButton) {
        
        if(sender.tag == 19){
            // clear display and reset saved number
            displayLabel.text = ""
            historyLabel.text = ""
            currentNumber = 0
            operation = 0
        }
        if(sender.tag == 18){
            // delete last input number
            // check if display has numbers
            if(displayLabel.text != ""){
                displayLabel.text?.removeLast()
                historyLabel.text?.removeLast()
            }
        }
        if(sender.tag == 20){
            // clear everthing
            displayLabel.text = ""
            operation = 0
            // clear history
            historyLabel.text = ""
            history.removeAll()
        }
        
    }
    
    @IBAction func history(_ sender: UIButton) {
        // display the history
        if(!history.isEmpty){
            for items in history{
                print("\(items) + \n")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // start with cleared label
        displayLabel.text = ""
        historyLabel.text = ""
    }
    
    
    
}

