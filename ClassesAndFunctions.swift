//
//  TimeStampClass.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/12/22.
//
import UIKit
import Foundation

class TimeStamp {
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
