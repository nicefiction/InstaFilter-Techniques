// ContentView.swift

// MARK: - LIBRARIES -

import SwiftUI



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var image: Image?
   @State private var isShowingImagePickerSheet: Bool = false
   
   
   
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
      .sheet(isPresented: $isShowingImagePickerSheet) {
         UIImagePicker()
      }
   }
}





// MARK: - PREVIEWS -

struct ContentView_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ContentView()
   }
}
