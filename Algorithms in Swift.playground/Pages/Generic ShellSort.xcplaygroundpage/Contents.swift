//: [Previous](@previous)

import Foundation

var unsortedArray = [3, 7, 9, 0, 5, 1, 6, 8, 4, 2, 0, 6, 1, 5, 7, 3, 4, 8, 2]


//-----------Basic insertion sort------------------------------------------------
func insertionSort<T: Comparable>(_ input: [T], by comparison: (T, T) -> Bool) -> [T] {
    
    var items = input
  
    for index in 1..<items.count{
        
        var position = index
        let currentValue = items[position]
        
        while position > 0 && comparison(currentValue, items[position - 1]){
            
            //Shift the bigger (or smaller) value to the right
            items[position] = items[position - 1]
            position -= 1
        }
        
        //position found. insert the current value
        items[position] = currentValue
    }
    
    return items
}
//---------------------------------------------------------------


//Shell sort bases on insertion sort. It is better for bigger amount of date. Therefore it works with pre-selection
func shellSort<T: Comparable>(_ input: [T], by comparison: (T, T) -> Bool) -> [T] {

    var items = input
    var amountOfSublists = items.count / 2
    
    while amountOfSublists > 0 {
        
        for i in 0..<amountOfSublists {
            
            let startIndex = i * (items.count / amountOfSublists)
            let endIndex = startIndex + (items.count / amountOfSublists) - 1
            
            let tempArray = items[startIndex...endIndex]
            let sortedSubArray = insertionSort(Array(tempArray), by: comparison)
            
            items.replaceSubrange(startIndex...endIndex, with: sortedSubArray)
            
            print(items)
        }
        
        //Gap shrinks down to nearly zero. When it is 1 it iterates with the normal insertion sort over the whole pre-ordered array.
        amountOfSublists /= 2
    }
    
 return items
}

shellSort(unsortedArray, by: >)



//: [Next](@next)
