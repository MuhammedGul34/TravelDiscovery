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

struct Place: Decodable, Hashable {
    let name, thumbnail: String
}

class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init(){
        // network code will happen here
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
            // you want to check response status code and err
            
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                guard let data = data else { return }
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false
//                self.places = [1]
            }
        }.resume()
        
        
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
                ZStack {
                    Text(vm.errorMessage)
                    ScrollView{
                        ForEach(vm.places, id: \.self){ place in
                            VStack(alignment: .leading,spacing: 0){
                                Image("art1")
                                    .resizable()
                                    .scaledToFill()
                                Text(place.name)
                                    .padding()
                                    .font(.system(size: 14, weight: .semibold))
                            }.asTile()
                                .padding()
                        }
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
