//
//  ImageDetailView.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-16.
//

import SwiftUI

struct ImageDetailView: View {
    let imageModel: ImageModel
    
    @State var showMode: ShowMode = ShowMode.after
    @Environment(\.presentationMode) var pm
    
    init(imageModel: ImageModel) {
        self.imageModel = imageModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack {
                    Rectangle()
                    .fill(Color(.gray))
                    .aspectRatio(3/4, contentMode: .fit)
                           
                    switch showMode {
                    case .after:
                        Image(uiImage: imageModel.afterImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .layoutPriority(-1)
                    case .before:
                        Image(uiImage: imageModel.beforeImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .layoutPriority(-1)
                    }
                }
                .clipped()
                .cornerRadius(22)
                
                Picker("", selection: $showMode) {
                    ForEach(ShowMode.allCases, id: \.self) { Text($0.rawValue) }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.horizontal, 10)
            .navigationTitle(Text(imageModel.date))
            .navigationBarItems(leading: Button(action: {
                pm.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            })
        }
    }
}

enum ShowMode: String, CaseIterable, Identifiable {
    var id: ShowMode { self }
    case after, before
}

//struct ImageDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageDetailView()
//    }
//}
