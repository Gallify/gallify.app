//
//  SignIn.swift
//  Gallify
//
//  Created by Tejvir Mann on 5/4/22.
//

import Foundation
import Swift
import FirebaseFirestore
import FirebaseFirestoreSwift

class SignIn: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {
        case token
        case userData
        


    }

    @Published var token: String
    @Published var userData: User

    init() {
        token = ""
        userData = User()
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decode(String.self, forKey: .token)
        userData = try container.decode(User.self, forKey: .userData)



    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(token, forKey: .token)
        try container.encode(userData, forKey: .userData)
        

      
    }
}

