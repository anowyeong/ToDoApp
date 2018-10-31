import UIKit

var completedTasks: [String] = []

class CompletedViewController: UITableViewController {
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let completed = completedTasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "completeCell") as! UncompleteCell
        cell.textLabel?.text = completed
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
    }
    
   //click
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(completedTasks[indexPath.row])
        itemClicked = completedTasks[indexPath.row]
        clickRow = indexPath.row
        tableView.reloadData()
    }
    
    //delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            completedTasks.remove(at: indexPath.row)
            defaults.set(completedTasks, forKey: "Com")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let notificationNme = NSNotification.Name("NotifIdf")
       // NotificationCenter.default.addObserver(self, selector: #selector(CompletedViewController.reloadTableview), name: notificationNme, object: nil)
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
