//
//  MapQueryService.swift
//  Gallify
//
//  Created by Tejvir Mann on 8/13/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Firebase
import GeoFire
import CoreLocation


class MapQuery : ObservableObject {
    
    
    
    func getPlaylistNearby(lat:Int, lon: Int, radius: Double) {

        
        // Find cities within 50km of London
        let center = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
        let radiusInM = radius
        // Each item in 'bounds' represents a startAt/endAt pair. We have to issue
        // a separate query for each pair. There can be up to 9 pairs of bounds
        // depending on overlap, but in most cases there are 4.
        let queryBounds = GFUtils.queryBounds(forLocation: center,
                                              withRadius: radiusInM)
        
        
        let queries = queryBounds.map { bound -> Query in
            return FirestoreQuery.db.collection("playlists")
                .order(by: "geohash")
                .start(at: [bound.startValue])
                .end(at: [bound.endValue])
                .limit(to: 10)
        }
        
        
        
        
        
        
        // Create a dispatch group outside of the query loop since each iteration of the loop
        // performs an asynchronous task.
        let dispatch = DispatchGroup()
        var matchingDocs = [QueryDocumentSnapshot]()
        
        
        // Collect all the query results together into a single list
        func getDocumentsCompletion(snapshot: QuerySnapshot?, error: Error?)  -> () {
            guard let documents = snapshot?.documents else {
                print("Unable to fetch snapshot data. \(String(describing: error))")
                dispatch.leave() // leave the dispatch group when we exit this completion
                return
            }
             
             print(documents)
            
            for document in documents {
                let lat = document.data()["lat"] as? Double ?? 0
                let lng = document.data()["lon"] as? Double ?? 0
                let name = document.data()["name"] as? String ?? "no name"
                let coordinates = CLLocation(latitude: lat, longitude: lng)
                let centerPoint = CLLocation(latitude: center.latitude, longitude: center.longitude)
                
                // We have to filter out a few false positives due to GeoHash accuracy, but
                // most will match
                let distance = GFUtils.distance(from: centerPoint, to: coordinates)
                if distance <= radiusInM {
                    matchingDocs.append(document)
                    print(matchingDocs)
                }
            }
            dispatch.leave() // leave the dispatch group when we exit this completion
        }
        
        // After all callbacks have executed, matchingDocs contains the result. Note that this
        // sample does not demonstrate how to wait on all callbacks to complete.
        for query in queries {
            dispatch.enter() // enter the dispatch group on each iteration
           // DispatchQueue.main.async{
                //Task{
                    query.getDocuments(completion: getDocumentsCompletion)
                //}
            //}
            
            
        }
        // [END fs_geo_query_hashes]
        
        // This is the completion handler of the dispatch group. When all of the leave()
        // calls equal the number of enter() calls, this notify function is called.
        dispatch.notify(queue: .main) {
            for doc in matchingDocs {
//                let lat = doc.data()["lat"] as? Double ?? 0
//                let lng = doc.data()["lng"] as? Double ?? 0
//                let name = doc.data()["name"] as? String ?? "no name"
//                let coordinates = CLLocation(latitude: lat, longitude: lng)
               print(doc)
                
            }
        }
        
        
        
        
    }
    
    
}
