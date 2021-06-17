//
//  PhotoPicker.swift
//  ios-photo-gallery
//
//  Created by Yinsheng Dong on 2021-06-17.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let mode: PhotoPickerMode
    let action: (UIImage?) -> ()
    
    var itemProviders: [NSItemProvider] = []
    
    func makeUIViewController(context: Context) -> UIViewController {
        if mode == PhotoPickerMode.gallery {
            var configuration = PHPickerConfiguration()
            configuration.selectionLimit = 1
            configuration.filter = .images
            let controller = PHPickerViewController(configuration: configuration)
            controller.delegate = context.coordinator
            return controller
        } else {
            let controller = UIImagePickerController()
            controller.sourceType = .camera
            controller.delegate = context.coordinator
            return controller
        }
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        private var parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if !results.isEmpty {
                parent.itemProviders = []
            }
            parent.itemProviders = results.map(\.itemProvider)
            loadImage()
        }
        
        private func loadImage() {
            for itemProvider in parent.itemProviders {
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                        if let image = image as? UIImage {
                            self.parent.action(image)
                        } else {
                            print("Could not load image", error?.localizedDescription ?? "")
                            self.parent.action(nil)
                            
                        }
                        self.parent.isPresented = false
                    }
                }
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.isPresented = false
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            self.parent.action(image)
            self.parent.isPresented = false
        }
    }
}

enum PhotoPickerMode {
    case camera, gallery
}
