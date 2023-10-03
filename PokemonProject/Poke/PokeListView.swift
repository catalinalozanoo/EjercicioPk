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
    
    var body: some View {
        NavigationView{
            ZStack {
                List(searchResults) { pokemon in
                    LazyVStack {
                        NavigationLink {
                            DetailPokeView(result: pokemon, stats: Stats(base_stat: pokeDetVM.baseStats, effort: pokeDetVM.effortStats), types: TypeElement(slot: pokeDetVM.slotType, type: Species(name: pokeDetVM.nameSpec, url: pokeDetVM.urlSpec)))
                            //DetailPokeView(result: pokemon )
                        } label: {
                            HStack{
                                Text(pokemon.name.capitalized)

                                
                             /*   AsyncImage(url: URL(string: pokemon.url)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .background(.white)
                                        .frame(maxWidth: 40)
                                        .cornerRadius(16)
                                        .shadow(radius: 8, x: 5, y: 5)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(.gray.opacity(0.5))
                                        )
                                        .padding(.trailing)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.clear)
                                        .frame(maxWidth: 26, maxHeight: 26)
                                }*/
                                
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
