//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Sheikh Mohamed on 25/09/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
   
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizer")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
                  )
        }
    }
  
}

#Preview {
    AppetizerListView()
}
