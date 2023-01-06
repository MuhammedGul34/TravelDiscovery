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
                    NavigationLink {
                        CategoryDetailsView()
                    } label: {
                        VStack(spacing: 4){
                            Image(systemName: category.imageName)
                                .font(.system(size: 27))
                                .foregroundColor(Color.orange)
                                .frame(width: 70, height: 70)
                                .background(Color.white)
                                .cornerRadius(.infinity)

                            Text(category.name)
                                .font(.system(size: 12, weight: .semibold))
                        }.frame(width: 68)
                    }.foregroundColor(Color.white)

                }
            }.padding(.horizontal)
        }
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            CategoryDetailsView()
        }
//        ZStack{
//            Color.orange
//            DiscoverCategoriesView()
//        }
        DiscoverView()
    }
}
