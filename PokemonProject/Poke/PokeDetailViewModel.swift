//
//  DetailPokeViewModel.swift
//  PokemonProject
//
//  Created by catalina lozano on 30/09/23.
//

import Foundation

@MainActor
class PokeDetailViewModel: ObservableObject {
    
    private struct Main: Codable {
        var height: Double
        var weight: Double
        var id: Int
        var sprites: Sprite
        var types: [TypeElement]
        var stats: [Stats]
    }
    
    /*
    struct Stats: Codable {
        var base_stat: Int
        var effort: Int
        var stat: Species
    }
    struct TypeElement: Codable {
        let slot: Int
        let type: Species
    }
    struct Species: Codable {
        var name: String
        var url:String
    }*/
  
    var urlString = ""
    @Published var typesArray: [TypeElement] = []
    @Published var statsArray: [Stats] = []
    @Published var height = 0.0
    @Published var weight = 0.0
    @Published var id = 0
    @Published var imageUrl = ""
    @Published var imageUrlShiny = ""
    
    @Published var nameSpec = ""
    @Published var urlSpec = ""
    
    @Published var slotType = 0
    
    @Published var nameType = ""
    @Published var urlType = ""
    
    @Published var baseStats = 0
    @Published var effortStats = 0
    
    @Published var nameStat = ""
    @Published var urlStat = ""
    
    func getData() async{
        print("we are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Error: could not create a url from \(urlString)")
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(Main.self, from: data) else {
                print("Error: could not decode returned JSON data")
                return
            }
            self.statsArray = self.statsArray + returned.stats
            self.typesArray = self.typesArray + returned.types
            self.height = returned.height
            self.weight = returned.weight
            self.id = returned.id
            self.imageUrl = returned.sprites.front_default ?? ""
            self.imageUrlShiny = returned.sprites.front_shiny ?? ""
           
          //  self.slotType = returned.types[TypeElement].slot
            
        } catch {
           print("Error: could not user URL at \(urlString) to get data and response")
        }
    }
}
