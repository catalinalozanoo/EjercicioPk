//
//  MainModel.swift
//  PokemonProject
//
//  Created by catalina lozano on 01/10/23.
//

import Foundation

struct Sprite: Codable {
    var front_default: String?
    var front_shiny: String?
    
}
struct Stats: Codable, Identifiable {
    let id = UUID().uuidString
    var base_stat: Int
    var effort: Int
    var stat: Species
    
    enum CodingKeys: CodingKey{
        case base_stat, effort
        case stat
    }
}
struct TypeElement: Codable {
    let id = UUID().uuidString
    var slot: Int
    var type: Species
    
}
struct Species: Codable {
    var name: String
    var url:String
}

