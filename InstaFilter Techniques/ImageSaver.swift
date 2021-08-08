// ImageSaver.swift

// MARK: - LIBRARIES -

import UIKit



class ImageSaver: NSObject {
   
   func writeToPhotoAlbum(image: UIImage) {
      
      UIImageWriteToSavedPhotosAlbum(image,
                                     self,
                                     #selector(saveError),
                                     nil)
   }
   
   
   @objc
   func saveError(_ image: UIImage,
                  didFinishSavingWithError error: Error?,
                  contextInfo: UnsafeRawPointer) { print("Save finished!") }
}
