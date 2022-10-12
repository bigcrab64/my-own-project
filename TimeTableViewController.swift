//
//  TimeTableViewController.swift
//  my own project
//
//  Created by De La Torre, Julian - Student on 10/7/22.
//

import UIKit

class TimeTableViewController: UIViewController, UITableViewDataSource{
    @IBOutlet weak var Table: UITableView!

    var timeStamps: [TimeStamp] = []
    
    
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
        if currentItem.hours > 0{
            if currentItem.minutes < 10 && currentItem.seconds < 10{
                cell.textLabel?.text = (String(currentItem.hours) + ":0" + String(currentItem.minutes) + ":0" + String(currentItem.seconds))
            }
                
            if currentItem.minutes < 10 && currentItem.seconds >= 10{
                cell.textLabel?.text = (String(currentItem.hours) + ":0" + String(currentItem.minutes) + ":" + String(currentItem.seconds))
            }
                
            if currentItem.minutes >= 10 && currentItem.seconds < 10{
                cell.textLabel?.text = (String(currentItem.hours) + ":" + String(currentItem.minutes) + ":0" + String(currentItem.seconds))
            }
                
            if currentItem.minutes >= 10 && currentItem.seconds >= 10{
                cell.textLabel?.text = (String(currentItem.hours) + ":" + String(currentItem.minutes) + ":" + String(currentItem.seconds))
            }
        }
        else{
            if currentItem.seconds >= 10{
                cell.textLabel?.text = (String(currentItem.minutes) + ":" + String(currentItem.seconds))
            }
                
            else{
                cell.textLabel?.text = (String(currentItem.minutes) + ":0" + String(currentItem.seconds))
                 }
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        else{
            cell.textLabel?.text = (String(currentItem.minutes) + ":" + String(currentItem.seconds))
        }
        
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


