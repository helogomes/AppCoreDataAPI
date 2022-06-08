//
//  ExtensionViewRegister.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import Foundation
import UIKit

extension UITextField{

func validateEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return validateRegex.evaluate(with: self.text)
}

func validatePassword() -> Bool {
    let passwordRegex = ".{6,}"
    let validateRegex = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return validateRegex.evaluate(with: self.text)
}
}

extension UIViewController {
    func showAlert(title: String) {
      let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
      let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
      alertController.addAction(okButton)
      self.present(alertController, animated: true,completion: nil)
      }
}
