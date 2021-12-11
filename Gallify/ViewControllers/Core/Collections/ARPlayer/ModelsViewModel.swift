//
//  ModelsViewModel.swift
//  Gallify
//
//  Created by Tejvir Mann on 12/10/21.
//

import Foundation
import FirebaseFirestore
import AlgoliaSearchClient

class ModelsViewModel: ObservableObject {
    @Published var models: [Model] = []
    
    private let db = Firestore.firestore()
    
    func fetchARData(){
        db.collection("model").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Firestore: No documents")
                return
            }
            
            self.models = documents.map {(queryDocumentSnapshot) -> Model in
                let data = queryDocumentSnapshot.data()
                
                let name = data["name"] as? String ?? ""
                let categoryText = data["category"] as? String ?? ""
                let category = ModelCategory(rawValue: categoryText) ?? .decor
                let scaleCompensation = data["scaleCompensation"] as? Double ?? 1.0
                
                return Model(name: name, category: category, scaleCompensation: Float(scaleCompensation))
                                             
                                             
                                             
                                        
                                             
                                            
                                             
                
            }
            
        }
    }
}
