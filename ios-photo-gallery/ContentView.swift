//
//  ContentView.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-15.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10, alignment: .top),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 10, alignment: .top)
                ], spacing: 10, content: {
                    ForEach(ImageModel.smaples, id: \.self) { model in
                        VStack(alignment: .leading, spacing: 3) {
                            ZStack {
                                Rectangle()
                                .fill(Color(.gray))
                                .aspectRatio(3/4, contentMode: .fit)
                                        
                                Image(uiImage: model.beforeImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .layoutPriority(-1)
                            }
                            .clipped()
                            .cornerRadius(22)

                            Text(model.date)
                                .font(.system(size: 13, weight: .semibold))
                        }
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
