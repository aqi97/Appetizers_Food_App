//
//  LoadingView.swift
//  Appetizers
//
//  Created by Sheikh Mohamed on 26/09/24.
//

import SwiftUI
 
struct ActivityIndicator: UIViewRepresentable {
//    typealias UIViewType = <#type#>
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .brandPrimary
        activityIndicator.startAnimating()
        return activityIndicator
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ActivityIndicator()
        }
    }
}
