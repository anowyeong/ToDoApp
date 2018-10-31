import UIKit

class EditCompleteTaskViewController: UIViewController {
    
  
    @IBOutlet weak var input: UITextField!
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        guard
            let index = clickRow,
            let inputtext = input.text
            else {
                return
        }
        completedTasks.remove(at: index)
        completedTasks.insert(inputtext, at: index)
        input.text = ""
        defaults.set(completedTasks, forKey: "Com")
    }
    
    @IBAction func switchButtonPressed(_ sender: Any) {
        guard
            let index = clickRow
            else {
                return
        }
        completedTasks.remove(at: index)
        uncompletedTasks.append(itemClicked!)
        defaults.set(uncompletedTasks, forKey: "Uncom")
        defaults.set(completedTasks, forKey: "Com")
    }

}
