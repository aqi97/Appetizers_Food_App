//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Sheikh Mohamed on 26/09/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromUrlString urlString: String) {
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage:View {
    var image: Image?
    
    var body: some View {
        
        image?.resizable() ?? Image("black").resizable()
    }
}

struct AppetizerRemoteImage:View {
    @StateObject var imageLoder = ImageLoader()
    let urlString:String
    
    var body: some View {
        RemoteImage(image: imageLoder.image)
            .onAppear{ imageLoder.load(fromUrlString: urlString)
                
            }
    }
}
