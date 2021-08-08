// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI



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
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
