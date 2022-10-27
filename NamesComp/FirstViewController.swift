//
//  ViewController.swift
//  NamesComp
//
//  Created by Blackwood Martain on 10/27/22.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var yourNameTextField: UITextField!
    
    @IBOutlet weak var partnerNameTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVS =  segue.destination as? ResultViewController else { return }
        destinationVS.firstName = yourNameTextField.text
        destinationVS.secondName = partnerNameTextField.text
    }
    
    @IBAction func resultButtonTapped() {
//        guard let firstName = yourNameTextField.text, let secondName = partnerNameTextField.text else { return }
//        if firstName.isEmpty || secondName.isEmpty {
//            showAlert(title: "Names are missing", message: "Please enter both names")
//            return
//        }
//        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwindSegueToFirstVC(segue: UIStoryboardSegue) {
        yourNameTextField.text = ""
        partnerNameTextField.text = ""
    }
    
}

extension FirstViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension FirstViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTextField {
            partnerNameTextField.becomeFirstResponder()
        } else {
            resultButtonTapped()
        }
        return true
    }
}
