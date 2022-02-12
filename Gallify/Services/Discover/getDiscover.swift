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
     Low priority feature. This method gets the list of recent searches.
     */
    func getRecentSearch() async {
        let userEmail = Auth.auth().currentUser?.email
        
        do {
            
            let doc = try await FirestoreQuery.db.collection("users").document(FirestoreQuery.userEmail ?? "help").collection("discover")
                .document("recentsearch")
                .getDocument().data(as: [Art].self)
            
            guard let recentSearches = doc else{
                throw DatabaseError.failed
            }
            
            self.recentSearches = recentSearches
            
        }
        catch{
            print("Error")
        }
    }
    
    
    /*
     High priority feature. This method gets content for the discover page.
     
     watch this video to understand: https://www.youtube.com/watch?v=poqTHxtDXwU
     */
    func getDiscoverContent(){
        
        if(self.getNextBatch){ //makes query get next batch of art for discover.
            self.discoverQuery = self.discoverQuery.start(afterDocument: self.lastDocument)
        }
        else{
            self.discoverQuery = FirestoreQuery.db.collection("art") //if first call.
                              .order(by: "popularity", descending: true)
                              .limit(to: 20)
        }
        
        self.discoverQuery.getDocuments() { (querySnapshot, err) in
             if let err = err {
                 print("Error getting documents: \(err)")
             }
            else {
                
                //Option 1: converts documents to [art] array to containing all art for page.
                self.discoveryPageArt = querySnapshot!.documents.compactMap { querySnapshot -> Art? in
                      return try? querySnapshot.data(as: Art.self)
                }
                
                
            //Option 2
              /*  var discover_art_array = [Art]()
                 querySnapshot!.documents.forEach({ (document) in
                    // let data = document.data() as [String: AnyObject] //convert to Art, and add to art array.
                     let data = try? document.data(as: Art.self)

                     //add to art data array.
                     discover_art_array.append(data!)
                 })
               
               self.discoveryPageArt = discover_art_array
               
               */
                
                self.lastDocument = querySnapshot!.documents.last //get last document for later.
              
                 
             }
         }
        
        
        
    }
    
    
    
}
