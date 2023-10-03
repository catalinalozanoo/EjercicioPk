//
//  PokeViewModel.swift
//  PokemonProject
//
//  Created by catalina lozano on 30/09/23.
//

import Foundation

@MainActor
class PokeViewModel: ObservableObject {
    
    private struct Main: Codable {
        var count: Int
        var next: String?
        var results: [Result]
        
    }
    
    @Published var urlString = "https://pokeapi.co/api/v2/pokemon/"
    @Published var count = 0
    @Published var pokeArray: [Result] = []
    @Published var isLoading = false
    
    
    func getData() async{
        print("we are accessing the url \(urlString)")
        isLoading = true
        
        guard let url = URL(string: urlString) else {
            print("Error: could not create a url from \(urlString)")
            isLoading = false
            return
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let returned = try? JSONDecoder().decode(Main.self, from: data) else {
                print("Error: could not decode returned JSON data")
                isLoading = false
                return
            }
                self.count = returned.count
            self.urlString = returned.next ?? ""
            self.pokeArray = self.pokeArray + returned.results
            
            isLoading = false
        } catch {
            isLoading = false
           print("Error: could not user URL at \(urlString) to get data and response")
        }
    }
    func loadNext(result: Result) async{
        guard let lastPokemon = pokeArray.last else {
            return
        }
        if result.id == lastPokemon.id && urlString.hasPrefix("http"){
            Task {
                await getData()
            }
        }
        
    }
    func loadAll() async {
        guard urlString.hasPrefix("http") else {return}
        await getData()
        await loadAll()
    }
}
