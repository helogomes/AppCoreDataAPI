//
//  ViewRegister.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class ViewRegister: UIViewController {
    
    var user: [NSManagedObject] = []
    var name: String = ""
    var registerViewModel = RegisterViewModel()
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name = tfName.text ?? ""
    }
    
    @IBAction func btConfirm(_ sender: Any) {
        
        if self.tfEmail.validateEmail() && self.tfPassword.validatePassword(){
            self.performSegue(withIdentifier: "Login", sender: nil)
            registerViewModel.saveUser(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
        }else {
            showAlert(title: "Erro ao cadastrar")
        }
    }
  
}
    
  
    
    
