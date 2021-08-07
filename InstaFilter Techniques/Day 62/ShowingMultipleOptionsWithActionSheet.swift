// ShowingMultipleOptionsWithActionSheet.swift
// MARK: SOURCE
// https://www.hackingwithswift.com/books/ios-swiftui/showing-multiple-options-with-actionsheet

// MARK: - LIBRARIES

import SwiftUI


struct ShowingMultipleOptionsWithActionSheet: View {
   
   // MARK: - PROPERTY WRAPPERS
   
   @State private var isShowingActionSheet: Bool = false
   @State private var backgroundColor = Color.white
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var body: some View {
      
      Text("Hello, World!")
         .font(.title)
         .fontWeight(.semibold)
         .frame(width: 300,
                height: 300)
         .background(backgroundColor)
         .onTapGesture {
            self.isShowingActionSheet.toggle()
         }
         .actionSheet(isPresented: $isShowingActionSheet,
                      content: {
            ActionSheet(title: Text("Change Background"),
                        message: Text("Select a new color."),
                        buttons: [
                           .default(Text("Red")) {
                              self.backgroundColor = Color.red
                           },
                           .default(Text("Blue")) {
                              self.backgroundColor = Color.blue
                           },
                           .default(Text("Yellow")) {
                              self.backgroundColor = Color.yellow
                           },
                           .cancel()
                        ])
         })
   }
}


/*
     var body: some View {
         Text("Hello, World!")
             .frame(width: 300, height: 300)
             .background(backgroundColor)
             .onTapGesture {
                 self.showingActionSheet = true
             }
     }
 */


// MARK: - PREVIEWS -

struct ShowingMultipleOptionsWithActionSheet_Previews: PreviewProvider {
   
   static var previews: some View {
      
      ShowingMultipleOptionsWithActionSheet()
   }
}
