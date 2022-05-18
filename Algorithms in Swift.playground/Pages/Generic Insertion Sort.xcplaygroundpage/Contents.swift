import UIKit

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

insertionSort(Array(1...10).shuffled(), by: <)

