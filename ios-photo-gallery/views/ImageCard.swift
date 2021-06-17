//
//  ImageCard.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-16.
//

import SwiftUI
import PhotosUI

struct ImageCard: View {
    let imageModel: ImageModel?
    
    @State private var showDetails: Bool = false
    @State private var showActionSheet: Bool = false
    @State private var showPhotoPicker: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            ZStack {
                Rectangle()
                .fill(Color(.gray))
                .aspectRatio(3/4, contentMode: .fit)
                if imageModel == nil {
                    Text("Add New Photos")
                        .font(.system(size: 13, weight: .semibold))
                } else {
                    Image(uiImage: imageModel!.afterImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
                }

            }
            .clipped()
            .cornerRadius(22)

            if imageModel != nil {
                Text(imageModel!.date)
                    .font(.system(size: 13, weight: .semibold))
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            showDetails = true
        }
        .sheet(isPresented: $showDetails, content: {
            ImageDetailView(imageModel: imageModel)
        })
    }
}
