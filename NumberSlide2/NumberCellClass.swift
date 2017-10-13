//
//  NumberCellClass.swift
//  NumberSlide2
//
//  Created by Prakash Sachania on 10/9/17.
//  Copyright © 2017 Prakash Sachania. All rights reserved.
//

import Foundation

/******************************************************************************
 *** Class name  : NumberPuzzle
 *** Description : This is model class that encapsulates all aspects of the
 *** puzzle.
 ***
 *** Properties:
 ***        solution (read-only) : holds current values in a 1x16 array where
 ***                                each position corresponds to a location on
 ***                                the puzzle
 ***        possibleMoves        : 16x4 array that holds possibility of movement
 ***                                for each possible of the puzzle
 ***                                x4 = move up, move left, move right, move down
 ***                                E.g. 1st entry is [-1, -1, 1, 4] means
 ***                                    move up : -1 = cannot move up
 ***                                    move left : -1 = cannot move left
 ***                                    move right : 1 = move to 1 (note that it is 0 based array index
 ***                                    move down : 4 = move to 4
 ***
 *** Methods:
 ***        checkAndMove()       : In: position number
 ***                               Out: new position, direction
 ***                                Function checks if input position can move
 ***                                in any of the 4 directions. If yes, it returns
 ***                                new position number and direction (up, left, right, down)
 ***                                Return -1 if it cannot move
 ***        isSolved()           : Out: true or false if puzzle is solved
 ***        randomizePuzzle()    : Randomly selects one of unsolved positions to start the game
 ******************************************************************************/
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
    
    /******************************************************************************
     *** Function Name  : init()
     *** In             : None
     *** Out            : None
     *** Description    : Default initilizer
     ***                  Randomizes the solution
     ******************************************************************************/
    init() {
        //randomize puzzle ... may be better design is to leave this decision to the user
        randomizePuzzle()
    }

    /******************************************************************************
     *** Function Name  : checkAndMove()
     *** In             : position number to be checked
     *** Out            : newPosition - new position number
     ***                : direction - direction of if move is possible
     ***
     *** Description    : Checks if position can be moved up, down, left or right.
     ***                  It moves if it can and returns new position
     ***                  If it cant move, it returns -1
     ******************************************************************************/
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
    
    /******************************************************************************
     *** Function Name  : isSolved()
     *** In             : None
     *** Out            : Bool - true if solved otherwise false
     *** Description    : Loops through solution's current values and determins if
     ***                  solution is found i.e. all numbers are sequential
     ***                  Returns true if it is solved
     ******************************************************************************/
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
    
    /******************************************************************************
     *** Function Name  : randomizePuzzle()
     *** In             : None
     *** Out            : None
     *** Description    : Randomizes solution and next game starts
     ***                  Currently limited alternatives are hard coded
     ***                  In future, this can be based on DB or algo
     ******************************************************************************/
    func randomizePuzzle() {
        random1()
    }
    
    private func randomSimple() {
        solution = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, -1, 13, 14, 15, 12]
    }
    
    private func random1() {
        solution = [10, 1, 13, 3, 11, 5, 2, -1, 14, 4, 12, 8, 7, 6, 9, 15]
    }
}
