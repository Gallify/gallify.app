//
//  Extensions.swift
//  Gallify
//
//  Created by Shruti Sharma on 10/24/21.
//

//As of 05/31/22 THIS IS UNUSED.

import Foundation

extension User {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        else {
            throw NSError()
        }
        return dictionary
    }

}

//extension Decodable {
//    func decode<String:Any>(dictionary: [String:Any]) throws -> [String:Any]{
//        let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
//        let decoder = JSONDecoder()
//        return try JSONDecoder().decode(String.self, from: data)
//    }
//}
