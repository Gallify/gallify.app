//
//  discoverHome.swift
//  Gallify
//
//  Created by Tejvir Mann on 1/17/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import AlgoliaSearchClient

extension FirestoreQuery {
    
    /*
     Search
     */
    @MainActor
    func search(searchText: String){
        let client = SearchClient(appID: "D1K1VO0U2E", apiKey: "bc7f663e539795736e1fad8c1adaeae1")
        let index = client.index(withName: "prod_Gallify")
        let decoder = JSONDecoder()

        
        if(searchText == ""){}
        
        else{
            //print("Error: \(searchText)")
            index.search(query: "\(searchText)") { result in
              switch result {
              case .failure(let error):
                print("Error: \(error)")
              case .success(let response):
              //  print("Response: \(response)")
                do {
                    let hits: [Art]? = try? response.extractHits()
                    
                    DispatchQueue.main.async{
                        self.foundContacts = hits!
                 //       print("Found contacts: \(self.foundContacts)")
                    }
                } catch let error {
                  print("Contact parsing error: \(error)")
                }
              }
            }
        }
    }
    
    
    
    /*
     
     */
    func getRecentSearch(){
        
    }
    
    
    /*
     
     */
    func getDiscoverContent(){
        
    }
    
    
}
