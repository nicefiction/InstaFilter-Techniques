// IntegratingCoreImage.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/integrating-core-image-with-swiftui
/*
 CGImage > UIImage
 CGImage > CIImage
 CGImage > SwiftUI Image
 
 UIImage > CGImage
 UIImage > CIImage
 UIImage > SwiftUI Image
 
 CIImage > CGImage
 */


// MARK: - LIBRARIES

import SwiftUI
/// STEP 1 : Create a UIImage .
import UIKit
/// STEP 2 : Create a Core Image context and a Core Image filter .
import CoreImage
import CoreImage.CIFilterBuiltins



struct IntegratingCoreImage: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var image: Image?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         image?
            .resizable()
            .scaledToFit()
      }
      .onAppear(perform: loadImage)
   }
   
   
   
   // MARK: - METHODS
   
   func loadImage() {
      // image = Image("Napoli")
      guard let _image = UIImage(named: "Napoli")
      else { return }
      
      let startImage = CIImage(image: _image)
      
      /// STEP 3 : Create the context and filter .
      let ciContext = CIContext()
      // let currentFilter = CIFilter.sepiaTone()
      // let currentFilter = CIFilter.pixellate()
      // let currentFilter = CIFilter.crystallize()
      guard let _filter = CIFilter(name: "CITwirlDistortion")
      else { return }
      
      
      /// We can now customize our filter to change the way it works .
      //currentFilter.inputImage = startImage
      
      // currentFilter.intensity = 1 // sepiaTone
      // currentFilter.scale = 100 // pixellate
      // currentFilter.radius = 200 // crystallize
      // currentFilter.setValue(startImage, forKey: kCIInputImageKey)
      _filter.setValue(startImage, forKey: kCIInputImageKey)
      _filter.setValue(2_000, forKey: kCIInputRadiusKey)
      _filter.setValue(CIVector(x: _image.size.width / 2,
                                y: _image.size.height / 2),
                       forKey: kCIInputCenterKey)
      
      /// Get a `CIImage` from our filter or exit if that fails :
      guard let _outputImage = _filter.outputImage
      else { return }
      
      /// Attempt to get a `CGImage` from our `CIImage` :
      if let _cgImage = ciContext.createCGImage(_outputImage,
                                                from: _outputImage.extent) {
         /// convert that to a `UIImage` ... :
         let uiImage = UIImage(cgImage: _cgImage)
         
         /// ... and convert that to a `SwiftUI Image` :
         image = Image(uiImage: uiImage)
      }
   }
}





// MARK: - PREVIEWS -

struct IntegratingCoreImage_Previews: PreviewProvider {
   
   static var previews: some View {
      
      IntegratingCoreImage()
   }
}
