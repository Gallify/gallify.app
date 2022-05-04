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
        case user
        


    }

    @Published var token: String
    @Published var user: User

    init() {
        token = ""
        user = User()
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decode(String.self, forKey: .token)
        user = try container.decode(User.self, forKey: .user)



    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(token, forKey: .token)
        try container.encode(user, forKey: .user)
        

      
    }
}

