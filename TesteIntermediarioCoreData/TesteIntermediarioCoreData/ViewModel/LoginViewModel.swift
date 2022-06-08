//
//  LoginViewModel.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import Foundation
import CoreData
import SwiftUI

class LoginViewModel {
    
    var user: [NSManagedObject] = []

    func login(email: String, password: String) -> Bool {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return false
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
            user = try managedContext.fetch(fetchRequest)
            
            for users in user {
                if email == users.value(forKey: "email") as? String && password == users.value(forKey: "password") as? String{
                    return true
                }
                
            }
            print("OK")
        } catch let error as NSError {
            print("Error \(error)")
        }
        return false
    }
}
