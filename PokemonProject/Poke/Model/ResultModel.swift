//
//  Result.swift
//  PokemonProject
//
//  Created by catalina lozano on 30/09/23.
//

import Foundation

struct Result: Codable, Identifiable, Equatable {
    let id = UUID().uuidString
   var name: String
   var url: String
    
    enum CodingKeys: CodingKey{
        case name, url
    }
}
