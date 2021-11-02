import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctNutton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var strepperButton: UIStepper!
    var percentip : Float = 0.1
    var resultSplit : Float = 0.0
    
    override func viewDidLoad() {
        strepperButton.value = 2
        strepperButton.minimumValue = 2
        billTextField.endEditing(false)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctNutton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch(sender.titleLabel!){
        case zeroPctButton.titleLabel:
            percentip = 0.0
            zeroPctButton.isSelected = true
            break
        case tenPctNutton.titleLabel:
            percentip = 0.10
            tenPctNutton.isSelected = true
            break
        default:
            percentip = 0.20
            twentyPctButton.isSelected = true
            break
    }
      
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(billTextField.text!)
        print(splitNumberLabel.text!)
        print(percentip)
        resultSplit = (Float(billTextField.text ?? "0.0")! * (percentip + 1.0))/Float(splitNumberLabel.text ?? "0.0")!
        print(resultSplit)
        self.performSegue(withIdentifier: "goToResult", sender: self )
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destination = segue.destination as! ResultsViewController
            destination.total = resultSplit
            destination.settings = "Slpit between \(String(describing: splitNumberLabel.text!)) people, with \(Int(percentip*100))% tip."
            
        }
    }
    
}
