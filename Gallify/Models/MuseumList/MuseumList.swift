/*
   MuseumList.swift
   Gallify
 
    A museumList is an array of museum elements.
 
    What are examples of a museum list? "Abstract category" or "Home Screen" Both contain list of museums.
    A museum is a list of playlists.
    
 
   Created by Tejvir Mann on 12/11/21.
 
 */


import Foundation
import Swift
import FirebaseFirestore

class MuseumList: Encodable, Decodable, ObservableObject {

    enum CodingKeys: CodingKey {

        case name
        case museums
        
        case genre //these aren't needed, but let's have them!
        case location

    }

    @Published var name: String
    @Published var museums: [String]
    
    @Published var location: String
    @Published var genre: String
    
    init() {
        
        name = ""
        genre = ""
        location = ""
        museums = [String]()

    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        name = try container.decode(String.self, forKey: .name) //ex. home, abstract, smithsonian
        genre = try container.decode(String.self, forKey: .genre)
        location = try container.decode(String.self, forKey: .location)
        museums = try container.decode([String].self, forKey: .museums)
       


    }
    
    func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(museums, forKey: .museums)
        try container.encode(genre, forKey: .genre)
        try container.encode(location, forKey: .location)
      
    }
}

