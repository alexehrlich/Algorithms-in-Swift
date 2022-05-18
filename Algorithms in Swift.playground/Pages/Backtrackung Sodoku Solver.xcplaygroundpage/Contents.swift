//: [Previous](@previous)

import Foundation
// '0' represnets an empty space
var testSodoku = [
    [0, 2, 6, 0, 0, 0, 8, 1, 0],
    [3, 0, 0, 7, 0, 8, 0, 0, 6],
    [4, 0, 0, 0, 5, 0, 0, 0, 7],
    [0, 5, 0, 1, 0, 7, 0, 9, 0],
    [0, 0, 3, 9, 0, 5, 1, 0, 0],
    [0, 4, 0, 3, 0, 2, 0, 5, 0],
    [1, 0, 0, 0, 3, 0, 0, 0, 2],
    [5, 0, 0, 2, 0, 4, 0, 0, 9],
    [0, 3, 8, 0, 0, 0, 4, 6, 0],
]

var hardSodoku1 = [
    [0, 0, 0, 0, 0, 0, 6, 8, 0],
    [0, 0, 0, 0, 7, 3, 0, 0, 9],
    [3, 0, 9, 0, 0, 0, 0, 4, 5],
    [4, 9, 0, 0, 0, 0, 0, 0, 0],
    [8, 0, 3, 0, 5, 0, 9, 0, 2],
    [0, 0, 0, 0, 0, 0, 0, 3, 6],
    [9, 6, 0, 0, 0, 0, 3, 0, 8],
    [7, 0, 0, 6, 8, 0, 0, 0, 0],
    [0, 2, 8, 0, 0, 0, 0, 0, 0]]

var hardSodoku2 = [
    [0, 0, 2, 8, 0, 0, 0, 7, 0],
    [0, 7, 0, 0, 2, 5, 0, 0, 0],
    [0, 8, 0, 0, 0, 7, 2, 0, 5],
    [9, 0, 0, 4, 0, 1, 0, 0, 6],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [6, 0, 0, 7, 0, 9, 0, 0, 1],
    [7, 0, 4, 3, 0, 0, 0, 1, 0],
    [0, 0, 0, 1, 7, 0, 0, 8, 0],
    [0, 9, 0, 0, 0, 2, 3, 0, 0],
]



//This method takes a number (to search for), a grid (to search in) and row and column for the given number.
//It returns true, if the number is valid to place (does not appear in row, column or in the box)
func isNumberPossible(_ number: Int, grid: [[Int]], row: Int, column: Int) -> Bool {
    
    //check if possible number exists in row
    for item in grid[row]{
        if item == number { return false }
    }
    
    //check if possible number exists in column
    for row in grid{
        if row[column] == number { return false }
    }
    
    //check if possible number exists in subsquare of the current cell
    let subsquareRowOrigin = Int(row / 3) * 3
    let subsquareColOrigin = Int(column / 3) * 3
    for row in 0...2{
        for column in 0...2{
            if grid[row + subsquareRowOrigin][column + subsquareColOrigin] == number { return false}
        }
    }
    return true
}


//This method takes a sodoku and tries to solve it. It returns the solved puzzle.
//The method uses recursion and backtracking when a wrong decision was made at a cell before.

func solve(_ sodoku: [[Int]]) -> [[Int]]{
    
        var tempGrid = sodoku
        
        //iterating over whole grid
        for row in 0...8{
            for column in 0...8{
                
                //A zero represents an empty field
                if tempGrid[row][column] == 0 {
                    
                    //try numbers from 1 to 9
                    numTestLoop: for i in 1...9{
                        
                        //take the first number which is valid to place
                        if isNumberPossible(i, grid: tempGrid, row: row, column: column){
                            
                            //set the number
                            tempGrid[row][column] = i
                            
                            //recursive call (go to next free field). If there is no solution, this method call returns.
                            //The current field can then be resetted for another attempt.
                            tempGrid = solve(tempGrid)
                            
                            //tempGrid is now the puzzler from the recursion level below.
                            
                            //If the function call from above returns, because there was no number found, the number at this position
                            //gets resetted. This shall only happen, when the puzzle is not solved yet ( when it cpntains a zero).
                            if tempGrid.joined().contains(0){
                                tempGrid[row][column] = 0
                            }
                        }
                    }
                    //if the count is 9, then there is no possible number -> return (go back) an try the next possible num at this point
                    return tempGrid
                }
            }
        }
        
        //At this point, the solver is at the deepest level and has found the solution. It will now return step by step to the top level to the first recursion caller.
        //Therefore we need to save the solution because it only exists at this level
        return tempGrid
    }


func printSodoku(_ sodoku: [[Int]]){
    for row in sodoku{
        print(row)
    }
    print("\n")
}


//: [Next](@next)

