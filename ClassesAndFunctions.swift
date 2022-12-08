//
//  TimeStampClass.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/12/22.
//
import UIKit
import Foundation

struct TimeStamp: Codable {
    var entryNumber: String
    
    var hours: Int
    var minutes: Int
    var seconds: Int
    
    init(entryNumber: String, hours: Int, minutes: Int, seconds: Int) {
        self.entryNumber = entryNumber
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    
    }
    
    
}
class total {
    
    var hours: Int
    var minutes: Int
    var seconds: Int

    init(hours: Int, minutes: Int, seconds: Int) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }


}
func toTextLabel(label: UILabel, hours: Int, minutes: Int, seconds: Int){
    if hours > 0{
        if minutes < 10 && seconds < 10{
            label.text = (String(hours) + ":0" + String(minutes) + ":0" + String(seconds))
        }
        
        if minutes < 10 && seconds >= 10{
            label.text = (String(hours) + ":0" + String(minutes) + ":" + String(seconds))
        }
        
        if minutes >= 10 && seconds < 10{
            label.text = (String(hours) + ":" + String(minutes) + ":0" + String(seconds))
        }
        
        if minutes >= 10 && seconds >= 10{
            label.text = (String(hours) + ":" + String(minutes) + ":" + String(seconds))
        }
    }
    else{
        if seconds >= 10{
            label.text = (String(minutes) + ":" + String(seconds))
        }
        
        else{
            label.text = (String(minutes) + ":0" + String(seconds))
        }
    }
}

func addToTotal(time: TimeStamp, currentTotal: total){
    let hours = time.hours
    let minutes = time.minutes
    let seconds = time.seconds
    
    var extraMinutes = 0
 
    
    var extraHours = 0

    let addedSecs = seconds + currentTotal.seconds
    if addedSecs >= 60{
        extraMinutes = addedSecs / 60 //add this to minutes later
        currentTotal.seconds = addedSecs % 60 // this is final amount of seconds
    }
    else{
        currentTotal.seconds = addedSecs
    }
    
    
    let addedMins = minutes + extraMinutes + currentTotal.minutes
    if addedMins >= 60{
        extraHours = addedMins / 60
        currentTotal.minutes = addedMins % 60
    }
    else{
        currentTotal.minutes = addedMins
    }
    currentTotal.hours += extraHours + hours
    
}

