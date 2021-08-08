// UIImagePicker.swift
// MARK: SOURCE
// 1. https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view
// 2. https://www.hackingwithswift.com/books/ios-swiftui/using-coordinators-to-manage-swiftui-view-controllers

/**
 `OVERVIEW`
 `STEP 1` : Create a SwiftUI view that conforms to `UIViewControllerRepresentable`.
 `STEP 2` : Give it a `makeUIViewController()` method that created some sort of `UIViewController`, which in our example was a `UIImagePickerController`.
 `STEP 3` : Add a `nested Coordinator class` to act as a bridge between the `UIKit view controller` and our `SwiftUI view` .
 `STEP 4` : Give that coordinator a `didFinishPickingMediaWithInfo()` method , which will be triggered by UIKit when an image was selected .
 `STEP 5` : Finally , give our `ImagePicker` an `@Binding` property so that it can send changes back to a parent view .
 
 SwiftUI’s coordinators are designed to act as _delegates_ for UIKit view controllers .
 Remember , _delegates_ are objects that respond to events that occur elsewhere .
 */

// MARK: - LIBRARIES -

import Foundation
import SwiftUI


/// STEP `1`
struct ImagePicker: UIViewControllerRepresentable {
   
   // typealias UIViewControllerType = UIImagePickerController
   
   
   
   // MARK: - PROPERTY WRAPPERS
   
   @Binding var image: UIImage?
   @Environment(\.presentationMode) var presentationMode
   
   
   
   // MARK: - NESTED TYPES
   
   /// STEP `3`
   class Coordinator: NSObject,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {
      
      // MARK: - PROPERTIES
      /// Rather than just pass the data down one level ,
      /// a better idea is to tell the coordinator what its parent is ,
      /// so it can modify values there directly .
      var parent: ImagePicker
      
      
      
      // MARK: - INITIALIZER METHODS
      
      init(_ parent: ImagePicker) { self.parent = parent }
      
      
      
      // MARK: - METHODS
      
      /// Reads the response from our UIImagePickerController :
      func imagePickerController(_ picker: UIImagePickerController,
                                 didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         if let _uiImage = info[.originalImage] as? UIImage {
            parent.image = _uiImage
         }
         
         parent.presentationMode.wrappedValue.dismiss()
      }
   }
   /*
    if let uiImage = info[.originalImage] as? UIImage {
        parent.image = uiImage
    }

    parent.presentationMode.wrappedValue.dismiss()
    */
   
   
   // MARK: - METHODS
   
   /// STEP `2`
   func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>)
   -> UIImagePickerController {
      
      let imagePicker = UIImagePickerController()
      imagePicker.delegate = context.coordinator
      return imagePicker
   }
   
   
   func updateUIViewController(_ uiViewController: UIImagePickerController,
                               context: Context) {}
   
   
   func makeCoordinator()
   -> Coordinator { Coordinator(self) }
}
