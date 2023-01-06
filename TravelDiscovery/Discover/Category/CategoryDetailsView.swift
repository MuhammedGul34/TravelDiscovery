//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 6.01.2023.
//

import SDWebImageSwiftUI
import SwiftUI
import Kingfisher



class CategoryDetailsViewModel: ObservableObject {
    
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage = ""
    
    init(){
        // network code will happen here
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=art") else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            
           
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
                                KFImage(URL(string: place.thumbnail))
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

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            CategoryDetailsView()
        }
    }
}
