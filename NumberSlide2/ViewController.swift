//
//  ViewController.swift
//  NumberSlide2
//
//  Created by Prakash Sachania on 10/8/17.
//  Copyright © 2017 Prakash Sachania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var moveCounter : Int = 0
    
    var numberPuzzle : NumberPuzzle = NumberPuzzle()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet var numberButtons: [UIButton]!
    
    @IBAction func numberPressed(_ sender: UIButton) {

        moveCounter += 1
        
        let newPosition = canMove(position: sender.tag)
        
        if newPosition > -1 {
            
            let temp = sender.currentTitle
            
            sender.setTitle(nil, for: .normal)
            sender.isHidden = true
            
            numberButtons[newPosition].setTitle(temp, for: .normal)
            numberButtons[newPosition].isHidden = false
        }
        
        if isSolved() {
            messageLabel.text = "Congratulations!"
            moveCounter = 0
        } else {
            messageLabel.text = "Moves : \(moveCounter)"
        }
        
    }

    func canMove(position: Int) -> Int {
        if numberButtons[position].currentTitle == nil {
            return -1
        }
        
        if possibleMoves[position][0] > -1 && numberButtons[possibleMoves[position][0]].currentTitle == nil {
            return possibleMoves[position][0]
        }
        if possibleMoves[position][1] > -1 && numberButtons[possibleMoves[position][1]].currentTitle == nil {
            return possibleMoves[position][1]
        }
        if possibleMoves[position][2] > -1 && numberButtons[possibleMoves[position][2]].currentTitle == nil {
            return possibleMoves[position][2]
        }
        if possibleMoves[position][3] > -1 && numberButtons[possibleMoves[position][3]].currentTitle == nil {
            return possibleMoves[position][3]
        }
        
        return -1
    }
    
    func isSolved() -> Bool {
        if numberButtons[15].currentTitle != nil {
            return false
        }
        
        for i in 0...14 {
            if numberButtons[i].currentTitle != String(numberButtons[i].tag+1) {
                return false
            }
        }
        
        return true
    }
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        randomizePuzzle()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomizePuzzle() {
        random1()
    }

    func randomSimple() {
        numberButtons[11].setTitle(nil, for: .normal); numberButtons[11].isHidden = true
        numberButtons[15].setTitle("12", for: .normal); numberButtons[15].isHidden = false
    }
    
    func random1() {
        //            solutionArray = [10, 1, 13, 3, 11, 5, 2, -1, 14, 4, 12, 8, 7, 6, 9, 15]

        numberButtons[0].setTitle("10", for: .normal); numberButtons[0].isHidden = false
        numberButtons[1].setTitle("1", for: .normal); numberButtons[1].isHidden = false
        numberButtons[2].setTitle("13", for: .normal); numberButtons[2].isHidden = false
        numberButtons[3].setTitle("3", for: .normal); numberButtons[3].isHidden = false

        numberButtons[4].setTitle("11", for: .normal); numberButtons[4].isHidden = false
        numberButtons[5].setTitle("5", for: .normal); numberButtons[5].isHidden = false
        numberButtons[6].setTitle("2", for: .normal); numberButtons[6].isHidden = false
        numberButtons[7].setTitle(nil, for: .normal); numberButtons[7].isHidden = true

        numberButtons[8].setTitle("14", for: .normal); numberButtons[8].isHidden = false
        numberButtons[9].setTitle("4", for: .normal); numberButtons[9].isHidden = false
        numberButtons[10].setTitle("12", for: .normal); numberButtons[10].isHidden = false
        numberButtons[11].setTitle("8", for: .normal); numberButtons[11].isHidden = false

        numberButtons[12].setTitle("7", for: .normal); numberButtons[12].isHidden = false
        numberButtons[13].setTitle("6", for: .normal); numberButtons[13].isHidden = false
        numberButtons[14].setTitle("9", for: .normal); numberButtons[14].isHidden = false
        numberButtons[15].setTitle("15", for: .normal); numberButtons[15].isHidden = false
    }
}

