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
//    let body = "\(collectionId)/\(artId)"
//
//    let finalBody = body.data(using: .utf8)
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
//    request.httpBody = finalBody

    
   // var request = URLRequest(url: url)
//    request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    //request.httpMethod = "POST"
    
//    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//        if let error = error {
//            print( "DataTask error: " + error.localizedDescription + "\n")
//        } else if
//            let data = data,
//            let response = response as? HTTPURLResponse,
//            response.statusCode == 200 {
//                DispatchQueue.main.async {
//                    print("Successfully posted art to marketplace");
//                }
//            }
//    }
//    task.resume()
    
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

