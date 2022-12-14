//
//  AddTimeViewController.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/6/22.
//

import UIKit

class AddTimeViewController: UIViewController {
    
    
    /*
     //MARK: INPUT
     */
    @IBOutlet weak var minutes: UITextField!
    
    @IBOutlet weak var minutesSliderText: UISlider!
    
    @IBAction func minutesSlider(_ sender: UISlider) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
        sender.setValue(sender.value.rounded(.down), animated: true)
        let valueToInt = Int(minutesSliderText.value)
        minutes.text = String(valueToInt)
    }
    
    
    @IBOutlet weak var seconds: UITextField!
    
    @IBOutlet weak var secondsSliderText: UISlider!
    
    @IBAction func secondsSlider(_ sender: UISlider) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
        sender.setValue(sender.value.rounded(.down), animated: true)
        let valueToInt = Int(secondsSliderText.value)
        seconds.text = String(valueToInt)
    }
    
    
    @IBAction func resignButton1(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }
    
    @IBAction func resignButton2(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }
    
    
    
    @IBAction func resignButton3(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }

    @IBAction func resignButton4(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }
    
    @IBAction func resignButton5(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }
    
    
    @IBAction func resignButton6(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }
    
    
    @IBAction func resignButton7(_ sender: UIButton) {
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
    }
   
    
 //MARK: VARIABLES N STUFF
    
    @IBOutlet weak var Output: UILabel!
    
    var timeStamps: [TimeStamp] = []
    var timeTotal = total(hours: 0, minutes: 0, seconds: 0)

    var toLog:[String: Array] = ["entryNumber": [1,2,3]]
    var entryCounter = -1
    
    //MARK: ADD BUTTON
    @IBAction func Add(_ sender: UIButton) {
        
        minutes.resignFirstResponder()
        seconds.resignFirstResponder()
        
        
        if minutes.text == "" || seconds.text == ""{
            Output.text = "Invalid Input"
        }
        else{
            if minutes.text!.count >= 4 || seconds.text!.count >= 4{
                Output.text = "Inputs can not exceed 3 digits"
            }
            else{
                
                entryCounter += 1
                var thing1 = Int(minutes.text ?? "")
                var thing2 = Int(seconds.text ?? "")
                
                var extraMinutes = 0
                var remainingSecs = 0
                
                
                var extraHours = 0
                var remainingMins = 0
                
                var addedSecs = thing2!
                if addedSecs >= 60{
                    extraMinutes = addedSecs / 60 //add this to minutes later
                    remainingSecs = addedSecs % 60 // this is final amount of seconds
                }
                else{
                    remainingSecs = addedSecs
                }
                
                var addedMins = thing1! + extraMinutes
                if addedMins >= 60{
                    extraHours = addedMins / 60
                    remainingMins = addedMins % 60
                }
                else{
                    remainingMins = addedMins
                }
                
                toTextLabel(label: Output, hours: extraHours, minutes: remainingMins, seconds: remainingSecs)
                let newTime = TimeStamp(entryNumber: ("Entry:" + String(entryCounter)), hours: extraHours, minutes: remainingMins, seconds: remainingSecs)
                
                timeStamps.append(newTime)
                addToTotal(time: newTime, currentTotal: timeTotal)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! TimeTableViewController
        nvc.timeStamps = timeStamps
        nvc.totalTime = timeTotal
        
               
        
        
        
        
    }
    @IBAction func toTable(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //entry -1
        }

        // Do any additional setup after loading the view.
    }
    


