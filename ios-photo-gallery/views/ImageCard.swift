//
//  ImageCard.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-16.
//

import SwiftUI

struct ImageCard: View {
    let imageModel: ImageModel?
    
    @State var showDetails: Bool = false
    @State var showActionSheet: Bool = false
    
    var body: some View {
        if imageModel == nil {
            VStack(alignment: .leading, spacing: 3) {
                ZStack {
                    Rectangle()
                    .fill(Color(.gray))
                    .aspectRatio(3/4, contentMode: .fit)
                            
                    Text("Add New Photos")
                        .font(.system(size: 13, weight: .semibold))
                }
                .clipped()
                .cornerRadius(22)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showActionSheet = true
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Please select an option to choose photoes"),
                    buttons: [
                        .default(Text("Pick from your gallery"), action: {}),
                        .default(Text("Take new picture"), action: {}),
                        .cancel()
                    ]
                )
            }
        } else {
            VStack(alignment: .leading, spacing: 3) {
                ZStack {
                    Rectangle()
                    .fill(Color(.gray))
                    .aspectRatio(3/4, contentMode: .fit)
                            
                    Image(uiImage: imageModel!.afterImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .layoutPriority(-1)
                }
                .clipped()
                .cornerRadius(22)

                Text(imageModel!.date)
                    .font(.system(size: 13, weight: .semibold))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showDetails = true
            }
            .sheet(isPresented: $showDetails, content: {
                ImageDetailView(imageModel: imageModel!)
            })
        }
    }
}

//struct ImageCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageCard()
//    }
//}
