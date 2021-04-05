import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(){
        showActionSheet()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Title", message: "Hello World", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped Dismiss")
        }))
        
        present(alert, animated: true)
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Title", message: "Hello World", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("tapped Dismiss")
        }))
        
        present(actionSheet, animated: true)
    }
}

