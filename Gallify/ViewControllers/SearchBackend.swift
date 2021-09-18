//
//  SearchBackend.swift
//  Gallify
//
//  Created by Patron on 9/1/21.
//

import Foundation
import AlgoliaSearchClient

struct search {
    //Connecting to Algolia Application
    let client = SearchClient(appID: "D1K1VO0U2E", apiKey: "8be852153db364843d9ad4d8396fa95d")
    
    
    func searchAlgolia(searchText: String) -> String {
        let index = client.index(withName: "Gallify")
        
        let settings = Settings()
          .set(\.searchableAttributes, to: ["name"])
        index.setSettings(settings) { result in
          switch result {
          case .failure(let error):
            print("Error when applying settings: \(error)")
          case .success:
            print("Success")
          }
        }

        // Search for a first name
        var searchResultJSON: String = ""
        var query = Query(searchText)
        query.attributesToRetrieve = ["name"]
        query.hitsPerPage = 10
        
        index.search(query: query) { result in
          if case .success(let response) = result {
            searchResultJSON =  "Response: \(response)"
            print("Success search : \(response)")
          }
        }
        
        return searchResultJSON
    }
}


