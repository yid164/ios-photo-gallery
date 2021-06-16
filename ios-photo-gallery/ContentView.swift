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
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12),
                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12)
                ], spacing: 12, content: {
                    ForEach(0..<20, id: \.self) { num in
                        VStack(alignment: .leading) {
                            Spacer()
                                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.blue)
                            Text("Date")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .padding()
                        .background(Color.red)
                    }
                }).padding(.horizontal, 12)
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
