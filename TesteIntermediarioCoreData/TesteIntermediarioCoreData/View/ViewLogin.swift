//
//  ViewLogin.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import Foundation
import UIKit
import CryptoKit
import Alamofire
import CoreData
import SwiftUI

class ViewLogin: UIViewController {
    
    var user: [NSManagedObject] = []
    var loginViewModel = LoginViewModel()
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btLogin(_ sender: UIButton) {
        
        if loginViewModel.login(email: tfEmail.text ?? "", password: tfPassword.text ?? "") {
            self.performSegue(withIdentifier: "LoginOk", sender: nil)
        }else {
            print("erro")
            let alert = UIAlertController(title: "Erro", message: "Usuário não cadastrado", preferredStyle: .alert)
            let action = UIAlertAction(title: "Tentar novamente", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
        
    }
        
}
    
    
