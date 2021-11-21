//
//  ImagePicker.swift
//  imagePicker
//
//  Created by Christopher Guirguis on 3/14/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//
import Foundation
import SwiftUI


//struct imagePicker:UIViewControllerRepresentable, Identifiable {
//    @Binding var pickedImage: Image?
//    @Binding var showImagePicker : Bool?
//    @Binding var imageData: Data
////    typealias UIViewControllerType = UIImagePickerController
////    typealias Coordinator = imagePickerCoordinator
//
//    var sourceType:UIImagePickerController.SourceType = .camera
//
//    func makeCoordinator() -> imagePicker.Coordinator {
//        return Coordinator(self)
//    }
//
//    func makeUIViewController(context: Context) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator as! UIImagePickerControllerDelegate & UINavigationControllerDelegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
//        picker.allowsEditing = true
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//
//    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationBarDelegate {
//        var parent: imagePicker
//        init(_ parent: imagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            let uiImage = info[.editedImage] as! UIImage
//            parent.pickedImage = Image(uiImage: uiImage)
//
//            if let mediaData = uiImage.jpegData(compressionQuality: 0.5) {
//                parent.imageData = mediaData
//            }
//            parent.showImagePicker = false
//        }
//    }
//
//
//
//}
struct imagePicker:UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var showImagePicker: Bool
//    @Binding var imageData = Data()
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = imagePickerCoordinator
    
    var sourceType:UIImagePickerController.SourceType = .camera
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePickerCoordinator(image: $image, showImagePicker: $showImagePicker)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {}
    
}

class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showImagePicker: Bool
        
    
    init(image:Binding<UIImage?>, showImagePicker: Binding<Bool>) {
            _image = image
            _showImagePicker = showImagePicker
           
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiimage
            showImagePicker = false
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        showImagePicker = false
    }


}
