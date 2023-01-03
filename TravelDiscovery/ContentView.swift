//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 3.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            ScrollView {
                
                DiscoverCategoriesView()
                
                PopularDestinationView()
                
                PopularRestaurantsView()
                
                TrendingCreatorsView()
                
            }.navigationTitle("Discover")
        }
    }
}

struct PopularDestinationView: View {
    var body: some View{
        VStack{
            HStack{
                Text("Popular Destination")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(0..<5, id: \.self){ num in
                        Spacer()
                            .frame(width: 125, height: 150)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2.0)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularRestaurantsView: View {
    var body: some View{
        VStack{
            HStack{
                Text("Popular Places to eat")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(0..<5, id: \.self){ num in
                        Spacer()
                            .frame(width: 210, height: 70)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2.0)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct TrendingCreatorsView: View {
    var body: some View{
        VStack{
            HStack{
                Text("Trending Creators")
                    .font(.system(size: 12, weight: .semibold))
                Spacer()
                Text("See All")
                    .font(.system(size: 12, weight: .semibold))
            }.padding(.horizontal)
                .padding(.top)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(0..<15, id: \.self){ num in
                        Spacer()
                            .frame(width: 58, height: 58)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2.0)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Category: Hashable {
    let name, imageName: String
}

struct DiscoverCategoriesView: View {
    
    let categories: [Category] = [
        .init(name: "Art", imageName: "paintpalette.fill"),
        .init(name: "Sport", imageName: "sportscourt.fill"),
        .init(name: "Live Events", imageName: "music.mic"),
        .init(name: "Food", imageName: "fork.knife"),
        .init(name: "History", imageName: "building.columns"),
        
        
        
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 14){
                ForEach(categories, id: \.self) { category in
                    VStack(spacing: 4){
//                        Spacer()
                        Image(systemName: category.imageName)
                            .font(.system(size: 27))
                            .foregroundColor(.white)
                            .frame(width: 70, height: 70)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2.0)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        }
    }
}
