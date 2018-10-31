import UIKit

class AddNewTaskViewController: UIViewController {
    
    
    @IBOutlet weak var input: UITextField!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        if let inputtext = input.text {
            uncompletedTasks.append(inputtext)
            input.text = ""
            defaults.set(uncompletedTasks, forKey: "Uncom")

          //  let notificationNme = NSNotification.Name("NotificationIdf")
          //  NotificationCenter.default.post(name: notificationNme, object: nil)
        } else {
            input.text = "Enter a new Task here!"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
