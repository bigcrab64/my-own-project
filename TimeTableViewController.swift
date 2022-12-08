//
//  TimeTableViewController.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/7/22.
//

import UIKit
import SwiftUI

class TimeTableViewController: UIViewController, UITableViewDataSource{
    @IBOutlet weak var Table: UITableView!
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var timeStamps: [TimeStamp] = []

    var totalTime = total(hours: 0, minutes: 0, seconds: 0)

    

    let savedHours = UserDefaults.standard.integer(forKey: "hrs")
    let savedMins = UserDefaults.standard.integer(forKey: "mins")
    let savedSecs = UserDefaults.standard.integer(forKey: "secs")
    
    @IBAction func saveButton(_ sender: UIButton) {
        UserDefaults.standard.set(totalTime.hours, forKey: "hrs")
        UserDefaults.standard.set(totalTime.minutes, forKey: "mins")
        UserDefaults.standard.set(totalTime.hours, forKey: "secs")
        print("08we9hfusoc")
    }
    
    var counter = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        if counter == 0 {
            totalTime.hours += UserDefaults.standard.value(forKey: "hrs") as! Int
            totalTime.minutes += UserDefaults.standard.value(forKey: "mins") as! Int
            totalTime.seconds += UserDefaults.standard.value(forKey: "secs") as! Int

            counter += 1
        }
        toTextLabel(label: totalLabel, hours: totalTime.hours, minutes: totalTime.minutes, seconds: totalTime.seconds)

        
    }
    
    
    func tableView(_ Table: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeStamps.count
    }
    
    
    func tableView(_ Table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        let currentTime = timeStamps[indexPath.row]
        Table.dataSource = self
            
        toTextLabel(label: totalLabel, hours: totalTime.hours, minutes: totalTime.minutes, seconds: totalTime.seconds)
        toTextLabel(label: cell.textLabel!, hours: currentTime.hours, minutes: currentTime.minutes, seconds: currentTime.seconds)
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


