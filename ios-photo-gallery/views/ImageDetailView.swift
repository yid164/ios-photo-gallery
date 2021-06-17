//
//  ImageDetailView.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-16.
//

import SwiftUI

struct ImageDetailView: View {
    @Binding var imageModel: ImageModel?
    
    @State var showMode: ShowMode = ShowMode.after
    @Environment(\.presentationMode) var pm
    
    @State private var showActionSheet: Bool = false
    @State private var showPhotoPicker: Bool = false
    @State private var imagePicked: UIImage?
    @State private var pickerMode: PhotoPickerMode?
    
    init(imageModel: Binding<ImageModel?>) {
        self._imageModel = imageModel
    }
    
    var todayString: String {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: today)
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
                        if imageModel == nil || imageModel?.afterImage == nil {
                            Text("Add After Photo")
                        } else {
                            Image(uiImage: imageModel!.afterImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                        }

                    case .before:
                        if imageModel == nil || imageModel?.beforeImage == nil {
                            Text("Add Before Photo")
                        } else {
                            Image(uiImage: imageModel!.beforeImage!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .layoutPriority(-1)
                        }
                    }
                }
                .clipped()
                .cornerRadius(22)
                .onTapGesture {
                    showActionSheet = true
                }
                .actionSheet(isPresented: $showActionSheet, content: {
                    ActionSheet(
                        title: Text("Please select an option to upload the photo"),
                        buttons: [
                            .default(Text("Pick from your photo gallery"), action: { self.showPhotoPicker = true; pickerMode = PhotoPickerMode.gallery }),
                            .default(Text("Take photo by your camera"), action: { self.showPhotoPicker = true; pickerMode = PhotoPickerMode.camera }),
                            .cancel()
                        ]
                    )
                })
                .sheet(isPresented: $showPhotoPicker, content: {
                    PhotoPicker(isPresented: $showPhotoPicker, mode: pickerMode!) { image in
                        if imageModel == nil {
                            imageModel = ImageModel(date: todayString)
                        }
                        switch showMode {
                        case .after:
                            imageModel!.afterImage = image
                        case .before:
                            imageModel!.beforeImage = image
                        }
                    }
                })
                
                Picker("", selection: $showMode) {
                    ForEach(ShowMode.allCases, id: \.self) { Text($0.rawValue) }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.horizontal, 10)
            .navigationTitle(Text( imageModel == nil ? todayString : imageModel!.date))
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
