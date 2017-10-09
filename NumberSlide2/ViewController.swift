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

    override func viewDidLoad() {
        super.viewDidLoad()
        numberPuzzle.randomizePuzzle()
        syncViewBasedOnModel()
    }

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
    
    //this function synchronizes view (buttons) according to current data model i.e. button's title and visibility
    func syncViewBasedOnModel() {
        for i in 0...15 {
            numberButtons[i].setTitle(String(numberPuzzle.solution[i]), for: .normal)
            numberButtons[i].isHidden = (numberPuzzle.solution[i] == -1) ? true : false
        }
    }

}

