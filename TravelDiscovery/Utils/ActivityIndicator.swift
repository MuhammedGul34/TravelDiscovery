//
//  ActivityIndicator.swift
//  TravelDiscovery
//
//  Created by Muhammed Gül on 6.01.2023.
//

import SwiftUI

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


struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView()
    }
}
