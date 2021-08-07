// UIImagePicker.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/wrapping-a-uiviewcontroller-in-a-swiftui-view

// MARK: - LIBRARIES -

import Foundation
import SwiftUI



struct UIImagePicker: UIViewControllerRepresentable {
   
   typealias UIViewControllerType = UIImagePickerController
   
   
   
   // MARK: - METHODS
   
   func makeUIViewController(context: Context)
   -> UIImagePickerController {
      
      let uiImagePicker = UIImagePickerController()
      
      return uiImagePicker
   }
   
   
   func updateUIViewController(_ uiViewController: UIImagePickerController,
                               context: Context) {}
}
