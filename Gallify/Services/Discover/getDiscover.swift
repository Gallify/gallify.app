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
     Search - For artwork.
     */
    @MainActor
    func search(searchText: String){
        
        let query = Query("query")
          .set(\.filters, to: "NOT searchType:2")
        //only searches approved artwork. 2 = un-reviewed.
        
        let client = SearchClient(appID: "D1K1VO0U2E", apiKey: "bc7f663e539795736e1fad8c1adaeae1")
        let index = client.index(withName: "prod_Gallify")
        let decoder = JSONDecoder()
        
        if(searchText == "" || searchText.count == 1){}
        else{
           // print("SEARCHTEXT: \(searchText)")
            index.search(query: "\(searchText)") { result in
              switch result {
              case .failure(let error):
                print("Error: \(error)")
              case .success(let response):
               // print("Response: \(response)")
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
    
    func search_user(searchText: String){
        let client = SearchClient(appID: "D1K1VO0U2E", apiKey: "56942b6aa3836c6e92db370dc5f3452d")
        let index = client.index(withName: "prod_Gallify_users")
        let decoder = JSONDecoder()
        
        
        if(searchText == "" || searchText.count == 1){}
        else{
           // print("SEARCHTEXT: \(searchText)")
            index.search(query: "\(searchText)") { result in
              switch result {
              case .failure(let error):
                print("Error: \(error)")
              case .success(let response):
               // print("Response: \(response)")
                do {
                    let hits: [User]? = try? response.extractHits()
                    
                    DispatchQueue.main.async{
                        self.foundContacts_users = hits!
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
       // let userEmail = Auth.auth().currentUser?.email
        
        do {
            
            let doc = try await FirestoreQuery.db.collection("users").document(FirestoreQuery.userId ?? "help").collection("discover")
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
    func getDiscoverContent() async {
        
        if(self.getNextBatch){ //makes query get next batch of art for discover.
            print("last doc")
            print(self.lastDocument)
            
            self.discoverQuery = try? await self.discoverQuery.start(afterDocument: self.lastDocument)
            
        }
        else{
            self.discoverQuery = try await FirestoreQuery.db.collection("art") //if first call.
                              .order(by: "popularity", descending: true)
                              .limit(to: 11)
        }
        
        self.discoverQuery.getDocuments() { (querySnapshot, err) in
             if let err = err {
                 print("Error getting documents: \(err)")
             }
            else {
                
                //Option 1: converts documents to [art] array to containing all art for page.
                var discoveryPageArtArray = [Art]()
                
                print("DiscoverContent")
                print(querySnapshot)
                discoveryPageArtArray = querySnapshot!.documents.compactMap { querySnapshot -> Art? in
                      return try? querySnapshot.data(as: Art.self)
                }
                print("End of conversion")
                
                print("Discover CONTENT Count")
                print(self.discoveryPageArt.count)
                if(discoveryPageArtArray.count > 1){
                    if(discoveryPageArtArray.count > 50){
                        self.discoveryPageArt = discoveryPageArtArray
                    }
                    else{
                        self.discoveryPageArt.append(contentsOf: discoveryPageArtArray)
                        self.discoveryPageArt.reverse()
                    }
                    
                    print("Discover CONTENT Count")
                    print(self.discoveryPageArt.count)
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
                self.getNextBatch = true
              
                 
             }
         }
    }
    

    
    
}
