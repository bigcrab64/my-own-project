//
//  TimeStampClass.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/12/22.
//

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


