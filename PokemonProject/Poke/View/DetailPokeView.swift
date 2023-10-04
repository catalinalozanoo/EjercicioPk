//
//  DetailPokeView.swift
//  PokemonProject
//
//  Created by catalina lozano on 30/09/23.
//

import SwiftUI

struct DetailPokeView: View {
    @StateObject var pokeDetailVM = PokeDetailViewModel()
    var result: Result
    var stats: Stats
    var types: TypeElement
    var species: Species
    @State var clickWater : Bool = false
    @State var clickBug : Bool = false
    @State var clickFire : Bool = false
    @State var clickNormal : Bool = false
    @State var clickDark : Bool = false
    @State var clickFlying : Bool = false
    @State var clickPoison : Bool = false
    @State var clickDragon : Bool = false
    @State var clickGhost : Bool = false
    @State var clickPsychic : Bool = false
    @State var clickElectic: Bool = false
    @State var clickGrass : Bool = false
    @State var clickRock : Bool = false
    @State var clickFairy : Bool = false
    @State var clickGround : Bool = false
    @State var clickSteel : Bool = false
    @State var clickFighting : Bool = false
    @State var clickIce : Bool = false
    
   
    
    var body: some View {
            VStack (alignment: .leading){
                    Text(result.name)
                    .bold()
                    .font(.system( size: 25))
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
                                .underline()
                            Text( String(pokeDetailVM.id))
                        }
                       
                        
                        HStack(alignment: .top){
                            Text("Height:")
                                .underline()
                              
                            Text(String(format: "%.1f", pokeDetailVM.height))
                               
                        }
                        HStack(alignment: .top){
                            Text("Weight:")
                                .underline()
                                
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
                        HStack{
                            Text("image:")
                                .underline()
                                .padding()
                            Text("shiny")
                        }
                    }
                }
                VStack(alignment: .leading){
                    Text("Stats")
                        .underline()
                       
                        VStack(alignment: .leading){
                            ForEach(pokeDetailVM.statsArray){ x in
                                HStack(spacing: 15){
                                    Text(x.stat.name)
                                    Text(String(x.base_stat))
                                }
                            }
                        }
                }.padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("Slot")
                            .padding(.top, 8)
                            .underline()
                        Text("Pokemon Type")
                            .padding(.top, 8)
                            .underline()
                    }
                    
                    VStack{
                        ForEach(pokeDetailVM.typesArray, id: \.id) { tipos in
                            HStack{
                              
                                if tipos.type.name == "water"{
                                    Button {
                                        clickWater.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.blue)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickWater) {
                                        PokeListView()
                                    }
                                    
                                    
                                } else if tipos.type.name == "bug"{
                                    Button {
                                        clickBug.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.green)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickBug) {
                                        PokeListView()
                                    }
                                    
                                } else if tipos.type.name == "fire"{
                                    Button {
                                        clickFire.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.red)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickFire) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "normal"{
                                    Button {
                                        clickNormal.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.purple)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickNormal) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "dark"{
                                    Button {
                                        clickDark.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.black)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickDark) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "flying"{
                                    Button {
                                        clickFlying.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.gray)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickFlying) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "poison"{
                                    Button {
                                        clickPoison.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                             
                                        }.foregroundStyle(Color.black)
                                            .bold()
                                           .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickPoison) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "dragon"{
                                    Button {
                                        clickDragon.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.cyan)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickDragon) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "ghost"{
                                    Button {
                                        clickGhost.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.purple)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickGhost) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "psychic"{
                                    Button {
                                        clickPsychic.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.pink)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickPsychic) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "electric"{
                                    Button {
                                        clickElectic.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.yellow)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickElectic) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "grass"{
                                    Button {
                                        clickGrass.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.green)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickGrass) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "rock"{
                                    Button {
                                        clickRock.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.brown)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickRock) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "fairy"{
                                    Button {
                                        clickFairy.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.pink)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickFairy) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "ground"{
                                    Button {
                                        clickGround.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.brown)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickGround) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "steel"{
                                    Button {
                                        clickSteel.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.cyan)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickSteel) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "fighting"{
                                    Button {
                                        clickFighting.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.orange)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickFighting) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "ice"{
                                    Button {
                                        clickIce.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.blue)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickIce) {
                                        PokeListView()
                                    }
                                } else if tipos.type.name == "water"{
                                    Button {
                                        clickWater.toggle()
                                    } label: {
                                        HStack(spacing: 45){
                                            Text(String(tipos.slot))
                                            Text(tipos.type.name)
                                        }.foregroundStyle(Color.teal)
                                            .bold()
                                            .padding(.leading, 10)
                                    }.fullScreenCover(isPresented: $clickWater) {
                                        PokeListView()
                                    }
                                }
                            
                                
                                
                                
                                
                            }
                        }
                    }
                    Spacer()
                   
                    AnnouncementView()
                }.padding()
            }.padding()
            Spacer()
                .task {
                    pokeDetailVM.urlString = result.url
                    await pokeDetailVM.getData()
                }
    }
}


#Preview {
    DetailPokeView(result: Result(name: "", url: ""), stats: Stats(base_stat: 0, effort: 0, stat: Species(name: "", url: "")), types: TypeElement(slot: 0, type: Species(name: "", url: "")), species: Species(name: "", url: ""))
}
