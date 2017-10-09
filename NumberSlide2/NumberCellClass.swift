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

    private(set) var solution : [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, -1]
    
    init() {
        randomizePuzzle()
    }
    
    func checkAndMove(position: Int) -> Int {
        if solution[position] == -1 {
            return -1
        }
        
        if possibleMoves[position][0] > -1 && solution[possibleMoves[position][0]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][0]] = temp
            return possibleMoves[position][0]
        }
        if possibleMoves[position][1] > -1 && solution[possibleMoves[position][1]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][1]] = temp
            return possibleMoves[position][1]
        }
        if possibleMoves[position][2] > -1 && solution[possibleMoves[position][2]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][2]] = temp
            return possibleMoves[position][2]
        }
        if possibleMoves[position][3] > -1 && solution[possibleMoves[position][3]] == -1 {
            let temp = solution[position]
            solution[position] = -1
            solution[possibleMoves[position][3]] = temp
            return possibleMoves[position][3]
        }
        
        return -1
    }
    
    func isSolved() -> Bool {
        if solution[15] != -1 {
            return false
        }
        
        for i in 0...14 {
            if solution[i] != i+1 {
                return false
            }
        }
        
        return true
    }
    

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
