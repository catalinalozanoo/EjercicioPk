//
//  DetailPokeView.swift
//  PokemonProject
//
//  Created by catalina lozano on 30/09/23.
//

import SwiftUI

struct DetailPokeView: View {
    @StateObject var pokeDetailVM = PokeDetailViewModel()
    @StateObject var pokeDetVM = PokeDetailViewModel()
    var result: Result
    var stats: Stats
    var types: TypeElement
    
    var pokeTypes: [TypeElement] = []
    //var spec: Species
    
    var body: some View {
            VStack (alignment: .leading, spacing: 3){
                Text("Stats")
                ForEach(pokeDetVM.statsArray){ x in
                    Text(String(x.base_stat))
                }
                    Text(result.name)
                        .font(Font.custom("Avenir Next Condensed", size: 25))
                        .bold()
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)

                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                HStack{
                    AsyncImage(url: URL(string: pokeDetailVM.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .background(.white)
                            .frame(maxWidth: 90)
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
                            .frame(maxWidth: 96, maxHeight: 96)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Pokemon number:")
                            Text( String(pokeDetailVM.id))
                        }
                       
                        
                        HStack(alignment: .top){
                            Text("Height:")
                              
                            Text(String(format: "%.1f", pokeDetailVM.height))
                               
                        }
                        HStack(alignment: .top){
                            Text("Weight:")
                                
                            Text(String(format: "%.1f", pokeDetailVM.weight))
                        }
                    }
                    .padding()
                }
                VStack {
                    HStack {
                       
                        AsyncImage(url: URL(string: pokeDetailVM.imageUrlShiny)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .background(.white)
                                .frame(maxWidth: 90)
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
                                .frame(maxWidth: 96, maxHeight: 96)
                        }
                        Text("image shiny")
                            .padding()
                    }
                }
                VStack {
                    Text("slot")
                    Text(String(pokeDetVM.slotType))
                    ForEach(pokeDetVM.statsArray, id: \.id) { stats in
                        Text(String(stats.base_stat))
                   }
                    
                
    
                }
            }.padding()
            Spacer()
            
                .task {
                    pokeDetailVM.urlString = result.url
                    await pokeDetailVM.getData()
                }
    }
}

#Preview {
    DetailPokeView(result: Result(name: "", url: ""), stats: Stats(base_stat: 0, effort: 0), types: TypeElement(slot: 0, type: Species(name: "", url: "")))
}
