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

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Int]()
    
    init(){
        // network code will happen here
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            self.places = [1,2,3,4,5,6,7]
        }
    }
}

struct ActivityIndicatorView: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    typealias UIViewType = UIActivityIndicatorView
}

struct CategoryDetailsView: View {

    @ObservedObject var vm = CategoryDetailsViewModel()
    
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                VStack{
                    ActivityIndicatorView()
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .semibold))
                }.padding()
                .background(Color.black)
                .cornerRadius(8)
                    
            } else {
                ScrollView{
                    ForEach(vm.places, id: \.self){ num in
                        VStack(alignment: .leading,spacing: 0){
                            Image("art1")
                                .resizable()
                                .scaledToFill()
                            Text("Demo123456")
                                .padding()
                                .font(.system(size: 12, weight: .semibold))
                        }.asTile()
                            .padding()
                    }
                }
            }
        }
      .navigationBarTitle("Category", displayMode: .inline)
        
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
