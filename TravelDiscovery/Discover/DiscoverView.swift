//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 3.01.2023.
//

import SwiftUI


struct DiscoverView: View {
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                LinearGradient(colors: [Color.orange, Color.white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color.discoverBackground
                    .offset(y: 400)
                
                ScrollView {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to?")
                        Spacer()
                    }.font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(14)
                        .background(Color(.init(white: 1, alpha: 0.3)))
                        .cornerRadius(10)
                        .padding(16)
                 
                    
                    DiscoverCategoriesView()
                    
                    VStack{
                        PopularDestinationsView()
                        
                        PopularRestaurantsView()
                        
                        TrendingCreatorsView()
                    }.background(Color.discoverBackground)
                        .cornerRadius(16)
                        .padding(.top, 32)
                }
            }.navigationTitle("Discover")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}


