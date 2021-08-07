// CreatingCustomBindings.swift
// MARK: - SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/creating-custom-bindings-in-swiftui

// MARK: - LIBRARIES -

import SwiftUI


struct CreatingCustomBindings: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var blurAmount: CGFloat = 0.0
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      let blur = Binding<CGFloat>(
         get: {
            self.blurAmount
         },
         set: {
            self.blurAmount = $0
            print("The new value is \(self.blurAmount).")
         }
      )
      
      VStack {
         Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .blur(radius: blurAmount)
         // Slider(value: $blurAmount, in: 0...20)
         Slider(value: blur, in: 0...20)
      }
      .padding()
   }
}





// MARK: - PREVIEWS -

struct CreatingCustomBindings_Previews: PreviewProvider {
   
   static var previews: some View {
      
      CreatingCustomBindings()
   }
}
