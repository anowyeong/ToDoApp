import UIKit

class AddNewTask4CompeletedViewController: UIViewController {
    
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addPressed(_ sender: UIButton) {
        if let inputtext = input.text{
            completedTasks.append(inputtext)
            input.text = ""
            defaults.set(completedTasks, forKey: "Com")
            
          //  let notificationNme = NSNotification.Name("NotifIdf")
           // NotificationCenter.default.post(name: notificationNme, object: nil)
        } else {
            input.text = "Enter a new task here!"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
}
