import UIKit
class ViewController: UIViewController {
	@IBOutlet private weak var display: UILabel!
	
	private var userIsInTheMiddleOfTyping = false
	
	@IBAction private func touchDigit(sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTyping {
			let textCurrentlyInDisplay = disply.text!
			if (digit != ".") || (textCurrentlyInDisplay.rangerOfString(".") == nil) {
			display.text = textCurrentlyInDisplay + digit
			}
		} else {
			display.text = digit
		}
		userIsInTheMiddleOfTyping = true
	}
	
	private var displayValue : Double{
		get{
			return Double(display.text!)!
		}
		set{
			display.text = String(newValue)
		}
	}
	
	private var brain = CalculatorBrain()
	
	@IBAction private func performOperation(sender: UIButton) {
		if userIsInTheMiddleOfTyping {
			brain.setOperand(displayValue)
			userIsInTheMiddleOfTyping = false
		}
		displayValue = brain.result
	}

}