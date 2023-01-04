//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 4.01.2023.
//

import SwiftUI

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


struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
        DiscoverView()
    }
}
