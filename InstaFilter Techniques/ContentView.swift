// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI
import UIKit



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var image: Image?
   @State private var isShowingImagePickerSheet: Bool = false
   @State private var inputImage: UIImage?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         image?
            .resizable()
            .scaledToFit()
         Button("Select Image") {
            self.isShowingImagePickerSheet.toggle()
         }
      }
      .sheet(isPresented: $isShowingImagePickerSheet,
             onDismiss: loadImage) {
         ImagePicker(image: self.$inputImage)
      }
   }
   
   
   
   // MARK: - METHODS
   
   func loadImage() {
      
      guard let _inputImage = inputImage
      else { return }
      
      image = Image(uiImage: _inputImage)

//      UIImageWriteToSavedPhotosAlbum(_inputImage,
//                                     nil,
//                                     nil,
//                                     nil)
      /// PARAMETER 1 : The Image to save .
      /// PARAMETER 2 : An object that should be notified about the result of the save .
      /// PARAMETER 3 : The method on the object that should be run .
      /// PARAMETER 4 : We can provide any sort of data here , and it will be passed back to us when our completion method is called . This is what UIKit calls _context_ , and it helps you identify one image save operation from another .
      
      let imageSaver = ImageSaver()
      imageSaver.writeToPhotoAlbum(image: _inputImage)
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
