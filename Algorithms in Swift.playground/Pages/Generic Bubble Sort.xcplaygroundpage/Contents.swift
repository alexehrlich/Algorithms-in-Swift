//: [Previous](@previous)

import Foundation

var unsortedList = Array(1...10).shuffled()

func bubbleSort<T: Comparable>(_ input: [T], by comparison: (T, T) -> Bool) -> [T]{
    
    var items = input
    var upperIndex = items.count - 1
    
    while upperIndex > 0 {
        for index in 0..<upperIndex {
            if comparison(items[index], items[index + 1]){
                items.swapAt(index, index + 1)
            }
        }
        upperIndex -= 1
    }
    return items
}

let sortedList = bubbleSort(unsortedList,by: <)
let sortedChar = bubbleSort(["x", "a", "r"], by: >)

//: [Next](@next)
