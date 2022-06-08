//
//  RegisterViewModel.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import Foundation
import CoreData
import UIKit

class RegisterViewModel{
    
    func saveUser(email: String, password: String) {
               guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
                return
               }
               let managedContext = appDelegate.persistentContainer.viewContext
               let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
               let user = NSManagedObject(entity: entity, insertInto: managedContext)
            
              user.setValue(email, forKey: "email")
              user.setValue(password, forKey: "password")
               
               do {
                   try managedContext.save()
                   print("Save")
               } catch let error as NSError {
                   print("Could not save. \(error)")
               }
  
    
    }
    
  

}
       
   
       
            
