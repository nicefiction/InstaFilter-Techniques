// HowPropertyObserversBecomeStructs.swift
// MARK: - SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/how-property-wrappers-become-structs
// https://docs.swift.org/swift-book/LanguageGuide/Properties.html

// MARK: - LIBRARIES -

import SwiftUI



struct HowPropertyObserversBecomeStructs: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var blurAmount: CGFloat = 0.00 {
      didSet {
         print("The slider has been set from \(oldValue) to \(blurAmount).")
      }
   }
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      VStack {
         Text("Hello World")
            .font(.largeTitle)
            .fontWeight(.bold)
            .blur(radius: blurAmount)
         Slider(value: $blurAmount,
                in: 0...20)
      }
      .padding()
   }
}





// MARK: - PREVIEWS -

struct HowPropertyObserversBecomeStructs_Previews: PreviewProvider {
   
   static var previews: some View {
      
      HowPropertyObserversBecomeStructs()
   }
}
