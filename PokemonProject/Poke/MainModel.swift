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
    
    enum CodingKeys: CodingKey{
        case base_stat, effort
    }
}
struct TypeElement: Codable{
    static func == (lhs: TypeElement, rhs: TypeElement) -> Bool {
        return true
    }
    
//    var id = UUID().uuidString
    var slot: Int
    var type: Species
}
struct Species: Codable {
    var name: String
    var url:String
}
/*
private struct Main: Codable {
    var height: Double
    var weight: Double
    var id: Int
    var sprites: Sprite
    var types: [TypeElement]
    var stats: [Stats]
}
struct Sprite: Codable {
    var front_default: String
    var front_shiny: String
    
}
struct Stats: Codable {
    var base_stat: Int
    var effort: Int
    var stat: Species
}
struct TypeElement: Codable, Identifiable {
    var id: Int {
            self.slot
        }
    
    static func == (lhs: TypeElement, rhs: TypeElement) -> Bool {
        return true
    }
    
    let slot: Int
    let type: Species
}
struct Species: Codable {
    var name: String
    var url:String
}

extension PokeDetailViewModel: Identifiable, Hashable {
    var identifier: String {
        return UUID().uuidString
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(identifier)
    }
    
    public static func == (lhs: PokeDetailViewModel, rhs: PokeDetailViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

*/
