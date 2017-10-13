//
//  ViewController.swift
//  NumberSlide2
//
//  Created by Prakash Sachania on 10/8/17.
//  Copyright © 2017 Prakash Sachania. All rights reserved.
//

import UIKit

/******************************************************************************
 *** Class name  : ViewController
 *** Description : This is View Controller class that encapsulates all aspects of the
 *** puzzle viewing
 ***
 *** Properties:
 ******************************************************************************/
class ViewController: UIViewController {

    var moveCounter : Int = 0
    var numberPuzzle : NumberPuzzle = NumberPuzzle()
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!        //collection of all number buttons ... 1 to 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberPuzzle.randomizePuzzle()      //randomize puzzle
        syncViewBasedOnModel()              //sync view according to model
    }
    
    /******************************************************************************
     *** Function Name  : resetPressed()
     *** In             : None
     *** Out            : None
     *** Description    : When reset button is pressed, a new game starts
     ******************************************************************************/
    @IBAction func resetPressed(_ sender: UIButton) {
        numberPuzzle.randomizePuzzle()
        syncViewBasedOnModel()
        moveCounter = 0 //reset move counter
        messageLabel.text = "Moves : \(moveCounter)"
    }
    
    /******************************************************************************
     *** Function Name  : numberPressed()
     *** In             : sender (button type)
     *** Out            : None
     *** Description    : Action for all buttons
     ***                  Checks if touched position (button) can be moved or not
     ***                  by calling NumberPuzzle class (data model class)
     ***                  If move is possible and data model is moved, then swap
     ***                  button titles and make the touched button as invisible
     ***                  Further it checks if the solution is solved or not with
     ***                  this move. If it does then displays congratulations message
     ******************************************************************************/
    @IBAction func numberPressed(_ sender: UIButton) {

        moveCounter += 1 //increment move counter
        messageLabel.text = "Moves : \(moveCounter)"

        //check if touched cell can be moved, if so, it is moved in the data model
        let (newPosition, _) = numberPuzzle.checkAndMove(position: sender.tag) //direction is not required

        //when moved, newPosition is not -1. So, need to swap titles for moving touched button to blank location
        if newPosition > -1 {
            let temp = sender.currentTitle
            sender.setTitle(nil, for: .normal)  //set touched button to blank
            sender.isHidden = true              //set touched button to invisible
            numberButtons[newPosition].setTitle(temp, for: .normal)     //set title where it moved
            numberButtons[newPosition].isHidden = false                 //set visibility

            //on every movement, check if puzzle is solved
            if numberPuzzle.isSolved() {
                messageLabel.text = "********* Congratulations! *********"
                moveCounter = 0
            }
        }
    }
    
    /******************************************************************************
     *** Function Name  : syncViewBasedOnModel()
     *** In             : None
     *** Out            : None
     *** Description    : Align's view state (button title) to underlyding data model (numberPuzzle class)
     ******************************************************************************/
    func syncViewBasedOnModel() {
        for i in 0...15 {
            numberButtons[i].setTitle(String(numberPuzzle.solution[i]), for: .normal)
            numberButtons[i].isHidden = (numberPuzzle.solution[i] == -1) ? true : false
        }
    }

}

