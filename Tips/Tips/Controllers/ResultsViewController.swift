import UIKit

class ResultsViewController: UIViewController {
    var total : Float?
    var settings : String?
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        totalLabel.text = String(format: "%.2f", total ?? 0.0)
        settingsLabel.text = settings ?? "Can't read parameters, try again."
    }

    @IBAction func calculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
