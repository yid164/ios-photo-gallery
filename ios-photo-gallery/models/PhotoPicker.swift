//
//  PhotoPicker.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-17.
//

import SwiftUI
import Photos
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var images: [UIImage]
    @Binding var isPresented: Bool
    var itemProviders: [NSItemProvider] = []
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
      
        private var parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if !results.isEmpty {
                parent.itemProviders = []
                parent.images = []
            }
            parent.itemProviders = results.map(\.itemProvider)
            loadImage()
        }
        
        private func loadImage() {
            for itemProvider in parent.itemProviders {
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let image = image as? UIImage {
                            self.parent.images.append(image)
                        } else {
                            print("Could not load image", error?.localizedDescription ?? "")
                            
                        }
                    }
                }
            }
        }
    }
}
