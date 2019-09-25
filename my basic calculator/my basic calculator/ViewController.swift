//
//  ViewController.swift
//  my basic calculator
//
//  Created by Andrew Tran on 9/24/19.
//  Copyright © 2019 Andrew Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    var previousNumber:Double = 0
    var currentNumber:Double = 0
    var operation = 0
    
    //MARK: Actions
    @IBAction func numButton(_ sender: UIButton) {
        
        //concatonate numbers for display
        answerLabel.text = answerLabel.text! + String(sender.tag)
        
        //save the number for operations
        currentNumber = Double(answerLabel.text!)!
        
    }
    
    @IBAction func operatorButton(_ sender: UIButton) {
        
        //check if display is not empty
        if(answerLabel.text != ""){
            //if operator button is clicked
            //save current number
            previousNumber = currentNumber
            //prep for another number for input
            historyLabel.text = String(previousNumber)
            if(sender.tag == 17){
                //divide
                historyLabel.text! += " / "
            }else if(sender.tag == 16){
                //multiply
                historyLabel.text! += " x "
            }else if(sender.tag == 15){
                //subtract
                historyLabel.text! += " - "
            }else if(sender.tag == 14){
                //addition
                historyLabel.text! += " + "
            }
            
            //save operation
            operation = sender.tag
            
        }else if(sender.tag == 13){
            //do operations
            if(operation == 17){
                currentNumber = previousNumber / currentNumber
            }else if(operation == 16){
                currentNumber = previousNumber * currentNumber
            }else if(operation == 15){
                currentNumber = previousNumber - currentNumber
            }else if(operation == 13){
                currentNumber = previousNumber + currentNumber
            }
            
            
        }
        
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
        answerLabel.text = String(currentNumber)
        
    }
    
    @IBAction func eraseButton(_ sender: UIButton) {
        
        if(sender.tag == 19){
            //clear display and reset saved number
            answerLabel.text = ""
            currentNumber = 0
        }
        if(sender.tag == 18){
            //clear last input number
            //check if display has numbers
            if(answerLabel.text != ""){
                answerLabel.text?.removeLast()
            }
        }
        if(sender.tag == 20){
            //clear everthing
            answerLabel.text = ""
            //clear history
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // start with cleared label
        answerLabel.text = ""
        historyLabel.text = ""
    }
    
    
    
}

