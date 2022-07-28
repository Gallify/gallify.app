//
//  postListAdmin.swift
//  Gallify
//
//  Created by Shruti on 6/17/22.
//
import Foundation

import FirebaseFirestore
import FirebaseAuth

extension FirestoreQuery {
    


func postArtToMarketplace(collectionId : String, artId:String) async  {
    let apiAddress = "https://api.gallify.app/v0/mint/\(collectionId)/\(artId)"
    let url = URL(string: apiAddress)!

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    URLSession.shared.dataTask(with: request){
               (data, response, error) in
               print(response as Any)
               if let error = error {
                   print(error)
                   return
               }
               guard let data = data else{
                   return
               }
               print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
               
           }.resume()
}
    
}
