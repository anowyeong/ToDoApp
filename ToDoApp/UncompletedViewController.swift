import UIKit
import Foundation


func saveArrs() {
    
    if let arr = UserDefaults.standard.object(forKey: "Uncom") as? [String]
        {
            uncompletedTasks = arr
            print(uncompletedTasks)
        }
    
    if let arr1 = UserDefaults.standard.object(forKey: "Com") as? [String]
    {
        completedTasks = arr1
        print(completedTasks)
    }
}


var uncompletedTasks: [String] = []
let defaults = UserDefaults.standard
var clickRow: Int?
var itemClicked: String?


class UncompletedViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uncompletedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let uncompleted = uncompletedTasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "uncompletedCell") as! UncompleteCell
        cell.textLabel?.text = uncompleted
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
    }

    //click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(uncompletedTasks[indexPath.row])
        itemClicked = uncompletedTasks[indexPath.row]
        clickRow = indexPath.row
        tableView.reloadData()
    }
    //delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            uncompletedTasks.remove(at: indexPath.row)
            defaults.set(uncompletedTasks, forKey: "Uncom")
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
   //     let notificationNme = NSNotification.Name("NotificationIdf")
     //   NotificationCenter.default.addObserver(self, selector: #selector(UncompletedViewController.reloadTableview), name: notificationNme, object: nil)
    }
    
    @objc func reloadTableview() {
        saveArrs()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        saveArrs()
        tableView.reloadData()
        
        
    }
    
    
    
}

