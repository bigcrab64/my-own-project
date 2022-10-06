//
//  ViewController.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 9/12/22.
//

import UIKit

class ViewController: UIViewController {

    /*
     //MARK: FIRST INPUT
     */
    @IBOutlet weak var minutes: UITextField!
    
    @IBOutlet weak var minutesSliderText: UISlider!
    
    @IBAction func minutesSlider(_ sender: UISlider) {
        sender.setValue(sender.value.rounded(.down), animated: true)
        let valueToInt = Int(minutesSliderText.value)
        minutes.text = String(valueToInt)
    }
    
    
    @IBOutlet weak var seconds: UITextField!
    
    @IBOutlet weak var secondsSliderText: UISlider!
    
    @IBAction func secondsSlider(_ sender: UISlider) {
        sender.setValue(sender.value.rounded(.down), animated: true)
        let valueToInt = Int(secondsSliderText.value)
        seconds.text = String(valueToInt)
    }
    
    
    /*
     //MARK: SECOND INPUT
     */
    
    
    @IBOutlet weak var otherMinutes: UITextField!
    
    @IBOutlet weak var otherMinutesText: UISlider!
    
    @IBAction func otherMinutesSlider(_ sender: UISlider) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
        otherMinutes.resignFirstResponder()
        otherSeconds.resignFirstResponder()
        sender.setValue(sender.value.rounded(.down), animated: true)
        let valueToInt = Int(otherMinutesText.value)
        otherMinutes.text = String(valueToInt)
    }
    
    
    @IBOutlet weak var otherSeconds: UITextField!
    
    @IBOutlet weak var otherSecondsText: UISlider!
    
    @IBAction func otherSecondsSlider(_ sender: UISlider) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
        otherMinutes.resignFirstResponder()
        otherSeconds.resignFirstResponder()
        sender.setValue(sender.value.rounded(.down), animated: true)
        let valueToInt = Int(otherSecondsText.value)
        otherSeconds.text = String(valueToInt)
    }
    
    
    @IBOutlet weak var Output: UILabel!
  
    @IBAction func Add(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
        otherMinutes.resignFirstResponder()
        otherSeconds.resignFirstResponder()
        
        if minutes.text == "" || seconds.text == "" || otherMinutes.text == "" || otherSeconds.text == ""{
            Output.text = "Invalid Input"
        }
        else{
            if minutes.text!.count >= 4 || seconds.text!.count >= 4 || otherMinutes.text!.count >= 4 || otherSeconds.text!.count >= 4{
                Output.text = "Inputs can not exceed 3 digits"
            }
            else{
                
                var thing1 = Int(minutes.text ?? "")
                var thing2 = Int(seconds.text ?? "")
                var thing3 = Int(otherMinutes.text ?? "")
                var thing4 = Int(otherSeconds.text ?? "")
                
                var extraMinutes = 0
                var remainingSecs = 0
                
                
                var extraHours = 0
                var remainingMins = 0
                
                var addedSecs = thing2! + thing4!
                if addedSecs >= 60{
                    extraMinutes = addedSecs / 60 //add this to minutes later
                    remainingSecs = addedSecs % 60 // this is final amount of seconds
                }
                else{
                    remainingSecs = addedSecs
                }
                
                
                var addedMins = thing1! + thing3! + extraMinutes
                if addedMins >= 60{
                    extraHours = addedMins / 60
                    remainingMins = addedMins % 60
                }
                else{
                    remainingMins = addedMins
                }
                
                if addedMins >= 60{
                    Output.text = (String(extraHours) + ":" + String(remainingMins) + ":" + String(remainingSecs))
                    print(extraHours, remainingMins, remainingSecs)
                }
                else{
                    Output.text = (String(remainingMins) + ":" + String(remainingSecs))
                    print(remainingMins, remainingSecs)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

