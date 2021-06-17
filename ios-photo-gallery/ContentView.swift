//
//  ContentView.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-15.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var samples = ImageModel.smaples
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10, alignment: .top)
                ], spacing: 10, content: {
                    ForEach(0..<samples.count, id: \.self) { index in
                        ImageCard(imageModel: $samples[index])
                    }
                }).padding(.horizontal, 10)
            }
            .navigationTitle("Photo Gallery")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
