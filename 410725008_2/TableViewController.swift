//
//  TableViewController.swift
//  410725008_2
//
//  Created by NDHU_CSIE on 2020/11/12.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var ballname=["baseball","basketball","football","other"]
    var checkball=[false,false,false,false]
    var ballimage=["baseball.png","basketball.png","football.png","other.png"]
    var ballimage_photo=["baseball_photo.jpg","basketball_photo.jpg","football_photo.jpg","other_photo.jpg"]
    @IBOutlet var output:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles=true

    }
    func outstring(){
        var out = " I like:"
        for i in 0..<4{
            if checkball[i]{
                out+=ballname[i]
                out+=" "
            }
        }
        output.text=out
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ballname.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        // Configure the cell...
        cell.nameball.text=ballname[indexPath.row]
        cell.imgball.image = UIImage(named: ballimage[indexPath.row])
        
        if checkball[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoview" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ViewController
                destinationController.ImageViewname = ballimage_photo[indexPath.row]
            }
        }
    }
     override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           
        let likeAction = UIContextualAction(style: .normal, title: "Like") { (action, sourceView, completionHandler) in
            //set the cell of the current row to be selected
            //get the selected cell
            //set the accessoryType of the selected cell to be checked
            //call a function: self. finalSelection()
            let cell = tableView.cellForRow(at: indexPath) as!TableViewCell
            cell.accessoryType = .checkmark
            self.checkball[indexPath.row]=true
            self.outstring()
               completionHandler(true)
           }
               
           let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
           
           return swipeConfiguration
       }
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
     let likeAction = UIContextualAction(style: .normal, title: "Unlike") { (action, sourceView, completionHandler) in
         //set the cell of the current row to be selected
         //get the selected cell
         //set the accessoryType of the selected cell to be checked
         //call a function: self. finalSelection()
         let cell = tableView.cellForRow(at: indexPath) as!TableViewCell
         cell.accessoryType = .none
         self.checkball[indexPath.row]=false
        self.outstring()
            completionHandler(true)
        }
            
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [likeAction])
        
        return swipeConfiguration
    }
    
}
