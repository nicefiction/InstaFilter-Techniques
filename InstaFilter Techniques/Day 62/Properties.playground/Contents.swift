// MARK: - SOURCE
// https://docs.swift.org/swift-book/LanguageGuide/Properties.html
// https://stackoverflow.com/questions/33091926/what-are-the-fundamental-differences-between-set-and-didset


import Foundation


struct Test {
   
   var x: Int = 10
   var y: Int = 8
   
   /// `get` and the `set` are used on computed properties :
   var computedNumber: Int {
      get {
         let multiplyXY: Int = x * y
         print("Get : x * y")
         return multiplyXY
      }
      
      set(newValue) {
         x = newValue/2
         y = newValue/2
         print("Set x/2 and y/2")
      }
   }
   
   /// `Property observers` observe and respond to changes in a property’s value .
   /// Use `didSet `and `willSet` to notify your structure of a value change :
   var totalNumber: Int = 0 {
      willSet(newValue) {
         print("The new value will be \(newValue).")
      }
      
      didSet {
         if oldValue < totalNumber {
            
            print("The value is now \(totalNumber). The old value was \(oldValue).")
         }
      }
   }
}


var test = Test() // Test
test.x // 10
test.y // 8
test.computedNumber // 80
test.computedNumber = 100 // Test
test.x // 50
test.y // 50
test.computedNumber // 2_500
test.computedNumber = 200 // Test
test.x // 100
test.y // 100
test.computedNumber // 10_000

test.totalNumber += 10
/* PRINTS :
 The new value will be 10.
 The value is now 10. The old value was 0.
 */


class StepCounter {
   
   var totalSteps: Int = 0 {
      
      willSet(newTotalSteps) {
         print("The new total will be \(newTotalSteps) steps.")
      }
      
      didSet {
         print("The previous total was \(oldValue) steps. \nThe new total is \(totalSteps) steps.")
      }
   }
}


let stepCounter = StepCounter()
stepCounter.totalSteps += 5
/* PRINTS :
 The new total will be 5 steps.
 The previous total was 0 steps.
 The new total is 5 steps.
 */
