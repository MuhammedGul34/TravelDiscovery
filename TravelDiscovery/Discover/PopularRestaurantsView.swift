//
//  PopularRestaurantsView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 4.01.2023.
//

import SwiftUI

struct PopularRestaurantsView: View {
    
    let restaurants: [Restaurant] = [
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

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
        DiscoverView()
    }
}
