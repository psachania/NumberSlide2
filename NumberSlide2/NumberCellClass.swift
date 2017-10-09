//
//  NumberCellClass.swift
//  NumberSlide2
//
//  Created by Prakash Sachania on 10/9/17.
//  Copyright © 2017 Prakash Sachania. All rights reserved.
//

import Foundation

class NumberPuzzle {
    
    //class level read only property
    let possibleMoves = [[-1, -1,  1,  4],
                         [-1,  0,  2,  5],
                         [-1,  1,  3,  6],
                         [-1,  2, -1,  7],
                         [ 0, -1,  5,  8],
                         [ 1,  4,  6,  9],
                         [ 2,  5,  7, 10],
                         [ 3,  6, -1, 11],
                         [ 4, -1,  9, 12],
                         [ 5,  8, 10, 13],
                         [ 6,  9, 11, 14],
                         [ 7, 10, -1, 15],
                         [ 8, -1, 13, -1],
                         [ 9, 12, 14, -1],
                         [10, 13, 15, -1],
                         [11, 14, -1, -1]]

    //read only solution array that holds current position of numbers. user should be able to read it but should not change it. it can be changed by calling checkAndMove method
    private(set) var solution : [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, -1]
    
    //returns which direction number moved, if it could move
    enum Direction {
        case left, up, right, down
    }
    
    //default initializer to randomize puzzle
    init() {
        //randomize puzzle ... may be better design is to leave this decision to the user
        randomizePuzzle()
    }

    //*****************************
    //checks if position can be moved up, down, left or right. It moves if it can and returns new position. If it cant move, it returns -1
    func checkAndMove(position: Int) -> (newPosition: Int, direction: Direction?) {
        if solution[position] == -1 { //blank position itself cannot be moved
            return (-1, nil)
        }
        
        //check if it can be moved left
        if possibleMoves[position][0] > -1 && solution[possibleMoves[position][0]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][0]] = temp
            return (possibleMoves[position][0], Direction.left)
        }
        
        //check if it can be moved up
        if possibleMoves[position][1] > -1 && solution[possibleMoves[position][1]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][1]] = temp
            return (possibleMoves[position][1], Direction.up)
        }
        
        //check if it can be moved right
        if possibleMoves[position][2] > -1 && solution[possibleMoves[position][2]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][2]] = temp
            return (possibleMoves[position][2], Direction.right)
        }
        
        //check if it can be moved down
        if possibleMoves[position][3] > -1 && solution[possibleMoves[position][3]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][3]] = temp
            return (possibleMoves[position][3], Direction.down)
        }
        
        //if none of the adjcent is found empty then return -1 to indicate not found
        return (-1, nil)
    }
    
    //*****************************
    //Check if the solutions is solved or not i.e. all numbers are sequential
    func isSolved() -> Bool {
        if solution[15] != -1 { //easy check is that last one should be blank
            return false
        }
        
        for i in 0...14 { //otherwise check all and see if they are according to the sequence. Note that array index is 0 based
            if solution[i] != i+1 {
                return false
            }
        }
        
        return true
    }
    
    //*****************************
    //randomization should have more alternates
    func randomizePuzzle() {
        randomSimple()
    }
    
    private func randomSimple() {
        solution = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, -1, 13, 14, 15, 12]
    }
    
    private func random1() {
        solution = [10, 1, 13, 3, 11, 5, 2, -1, 14, 4, 12, 8, 7, 6, 9, 15]
    }
}
