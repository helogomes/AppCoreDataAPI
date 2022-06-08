//
//  TableViewController.swift
//  TesteIntermediarioCoreData
//
//  Created by Heloisa on 06/06/22.
//

import Foundation
import Alamofire
import CryptoKit

class TableViewController {
    
        var charactersArray: [Character] = []
        
        let ts = String(Date().timeIntervalSince1970)
        let privateKey = "8bb31074dcefe19047d1690a8aa671dd409cc773"
        let publicKey = "321b54af8f3bf283420e2f77b7116bee"
        let characterId = ""
        
        func getCount() -> Int {
            return charactersArray.count
        }
        
        func getCharacter(indexPath: IndexPath) -> Character {
            return self.charactersArray[indexPath.row]
        }
        
        func MD5(data: String) -> String {
            let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
            return hash.map{ String(format: "%002hx", $0)
            }
            
            .joined()
        }
        
        func networkCharacters(name: String?, completion: @escaping (Bool, Error?) -> Void) {
            var url: String = ""
            let hash = self.MD5(data: "\(ts)\(privateKey)\(publicKey)")
            
            if name != nil {
                let nameCharacter: String = name ?? ""
                print(nameCharacter)
                url = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(nameCharacter)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"        } else {
                url = "https://gateway.marvel.com:443/v1/public/characters?limit=100&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
                }
            print("=======\(url)=======")
            
            AF.request(url).responseJSON { response in
                if let data = response.data {
                    do {
                        let result: CharacterAPIResult = try JSONDecoder().decode(CharacterAPIResult.self, from: data)
                        self.charactersArray = result.data.results
                        completion(true, nil)
                    } catch  {
                        completion(false, error)
                    }
                }
            }
        }
    
    }

