//
//  ContentView.swift
//  PokemonProject
//
//  Created by catalina lozano on 30/09/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokeListView: View {
    @StateObject var pokeVM = PokeViewModel()
    @StateObject var pokeDetVM = PokeDetailViewModel()
    @State private var searchText = ""
    @StateObject var pokeDetailVM = PokeDetailViewModel()
    @EnvironmentObject var vm: PokeDetailViewModel
    var body: some View {
       NavigationView{
            ZStack {
                
                List(searchResults) { pokemon in
                    LazyVStack {
                        NavigationLink {
                            DetailPokeView(result: pokemon, stats: Stats(base_stat: pokeDetVM.baseStats, effort: pokeDetVM.effortStats, stat: Species(name: pokeDetVM.nameSpec, url: pokeDetVM.urlSpec)), types: TypeElement(slot: pokeDetVM.slotType, type: Species(name: pokeDetVM.nameSpec, url: pokeDetVM.urlSpec)), species: Species(name: pokeDetVM.nameSpec, url: pokeDetVM.urlSpec))
                        } label: {
                            HStack{
                                Text(pokemon.name.capitalized)
                            }
                    }
                    }
                    .onAppear{
                        Task{
                         await pokeVM.loadNext(result: pokemon)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Pokemon Go")
                .toolbar{
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            Task{
                                await pokeVM.loadAll()
                            }
                        } label: {
                            Text("Load All")
                        }
                    }

                    ToolbarItem(placement: .status) {
                        Text("\(pokeVM.pokeArray.count) of \(pokeVM.count) pokemons")
                    }
                }
                .searchable(text: $searchText)
                if pokeVM.isLoading {
                ProgressView("loading...")
                    .font(.system(size: 6))
                    .progressViewStyle(CircularProgressViewStyle(tint: .green))
                    .scaleEffect(4)
                }
            }
        }
        .task {
            await pokeVM.getData()
        }
    }
    var searchResults: [Result]{
        if searchText.isEmpty{
            return pokeVM.pokeArray
        } else {
            return pokeVM.pokeArray.filter{$0.name.capitalized.contains(searchText)}
        }
    }
}

#Preview {
    PokeListView()
}
