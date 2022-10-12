//
//  TimeTableViewController.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/7/22.
//

import UIKit

class TimeTableViewController: UIViewController, UITableViewDataSource{
    @IBOutlet weak var Table: UITableView!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    var timeStamps: [TimeStamp] = []
    
    var totalTime = total(hours: 0, minutes: 0, seconds: 0)
    
    func addToTotal(time: TimeStamp){
        var hours = time.hours
        var minutes = time.minutes
        var seconds = time.seconds
        
        var extraMinutes = 0
     
        
        var extraHours = 0

        var addedSecs = seconds + totalTime.seconds
        if addedSecs >= 60{
            extraMinutes = addedSecs / 60 //add this to minutes later
            totalTime.seconds = addedSecs % 60 // this is final amount of seconds
        }
        else{
            totalTime.seconds = addedSecs
        }
        
        
        var addedMins = minutes + extraMinutes + totalTime.minutes
        if addedMins >= 60{
            extraHours = addedMins / 60
            totalTime.minutes = addedMins % 60
        }
        else{
            totalTime.minutes = addedMins
        }
        totalTime.hours += extraHours + hours
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
    }
    
    func tableView(_ Table: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeStamps.count
    }
    
    func tableView(_ Table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let currentItem = timeStamps[indexPath.row]
        Table.dataSource = self
        
        addToTotal(time: currentItem)
        totalLabel.text = (String(totalTime.hours) + ":" + String(totalTime.minutes) + ":" + String(totalTime.seconds))
        
        toTextLabel(label: totalLabel, hours: totalTime.hours, minutes: totalTime.minutes, seconds: totalTime.seconds)
        
        toTextLabel(label: cell.textLabel!, hours: currentItem.hours, minutes: currentItem.minutes, seconds: currentItem.seconds)
       
        return cell
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


