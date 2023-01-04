//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 3.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(colors: [Color.orange, Color.white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color(.init(white: 0.95, alpha: 1))
                    .offset(y: 400)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to?")
                        Spacer()
                    }.font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(10)
                        .padding(16)
                 
                    
                    DiscoverCategoriesView()
                    
                    VStack{
                        PopularDestinationView()
                        
                        PopularRestaurantsView()
                        
                        TrendingCreatorsView()
                    }.background(Color(.init(white: 0.95, alpha: 1)))
                        .cornerRadius(16)
                        .padding(.top, 32)
                }
            }.navigationTitle("Discover")
        }
    }
}

struct Destination: Hashable {
    let name, country, imageName: String
}

struct PopularDestinationView: View {
    
    let destinations: [Destination] = [
        .init(name: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(name: "Tokyo", country: "Japan", imageName: "japan"),
        .init(name: "New York", country: "US", imageName: "new_york"),
    ]
    
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
                    ForEach(destinations, id: \.self){ destination in
                        VStack(alignment: .leading, spacing: 0){
                            
                            Image(destination.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
//                                .clipped()
                                .cornerRadius(4)
                                .padding(.horizontal, 6)
                                .padding(.vertical,6)
                           
                            Text(destination.name)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                            
                            
                            Text(destination.country)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .foregroundColor(.gray)
                        }
//                            .frame(width: 125)
                        .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 2.0)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct restaurant: Hashable {
    let name, imageName: String
}

struct PopularRestaurantsView: View {
    
    let restaurants: [restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill")
    ]
    
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
                    ForEach(restaurants, id: \.self){ restaurant in
                        HStack(spacing: 8){
                            Image(restaurant.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(5)
                                .padding(.leading, 6)
                                .padding(.vertical, 6)
                            
                            VStack(alignment: .leading, spacing: 6){
                                HStack{
                                    Text(restaurant.name)
                                    Spacer()
                                    Button {
                                        print("111")
                                        // TODO: perform segur or whatever
                                    } label: {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(.black)
                                    }
                                }
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text("4.7 * Sushi * $$")
                                }
                                Text("Tokyo, Japon")
                                    
                            }.font(.system(size: 12, weight: .semibold))
                            
                            Spacer()
                                
                        }
                            .frame(width: 240)
                            .background(Color.white)
                            .cornerRadius(5)
                            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 5, x: 0.0, y: 2.0)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2.0)
                            .padding(.bottom)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct User: Hashable {
    let name, ImageName: String
}

struct TrendingCreatorsView: View {
    
    let users: [User] = [
        .init(name: "Amy Adams", ImageName: "amy"),
        .init(name: "Billy ", ImageName: "billy"),
        .init(name: "Sam Smith", ImageName: "sam")
    ]
    
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
                HStack(alignment: .top, spacing: 12){
                    ForEach(users, id: \.self){ user in
                        VStack{
                            Image(user.ImageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(.infinity)
                            Text(user.name)
                                .font(.system(size: 11, weight: .semibold))
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 60)
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
                            .foregroundColor(Color.orange)
                            .frame(width: 70, height: 70)
                            .background(Color.white)
                            .cornerRadius(.infinity)
//                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2.0)
                        Text(category.name)
                            .font(.system(size: 12, weight: .semibold))
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        }
    }
}
