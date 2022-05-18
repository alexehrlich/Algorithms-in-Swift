//: [Previous](@previous)

import Foundation

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


//unsorted list
var list = [3, 5, 8, 11, 1000, -7, 22]

//sorted lsit with insertion sort algorithm
let sortedList = insertionSort(list, by: <)

//Receives an list of integer and returns the index of the searched item or nil
func binarySearch<T: Comparable>(in list: [T], for element: T) -> Int?{
    
    var lowerBound = 0
    var upperBound = list.count
    var currentElement: T?
    
    while upperBound > lowerBound {
        
        //Choose median of the remaining elements
        let tempIndex = (upperBound + lowerBound)/2
        currentElement = list[tempIndex]
        
        //number found
        if currentElement! == element {
            return tempIndex
        }else if currentElement! < element{
            lowerBound = tempIndex + 1
        }else{
            upperBound = tempIndex
        }
    }
    return nil
}

binarySearch(in: sortedList, for: 543) //nil
binarySearch(in: sortedList, for: 8) //3


//: [Next](@next)
