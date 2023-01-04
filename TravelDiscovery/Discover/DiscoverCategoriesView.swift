//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 4.01.2023.
//

import SwiftUI

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


struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.orange
            DiscoverCategoriesView()
        }
        DiscoverView()
    }
}
