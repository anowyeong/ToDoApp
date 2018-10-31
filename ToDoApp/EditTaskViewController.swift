import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var input: UITextField!
    
    
    
    @IBAction func editPressed(_ sender: UIButton) {
        
        guard
            let index = clickRow,
            let inputtext = input.text
        else {
            return
        }
 
        uncompletedTasks.remove(at: index)
        uncompletedTasks.insert(inputtext, at: index)
        input.text = ""
        defaults.set(uncompletedTasks, forKey: "Uncom")
        
        
    }
    
    @IBAction func switchButtonPressed(_ sender: Any) {
        guard
            let index = clickRow
        else {
            return
        }
        uncompletedTasks.remove(at: index)
        completedTasks.append(itemClicked!)
        defaults.set(uncompletedTasks, forKey: "Uncom")
        defaults.set(completedTasks, forKey: "Com")
    }
    
}
