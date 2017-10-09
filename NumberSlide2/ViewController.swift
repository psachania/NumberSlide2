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
        
        let newPosition = numberPuzzle.checkAndMove(position: sender.tag)
        
        if newPosition > -1 {
            
            let temp = sender.currentTitle
            
            sender.setTitle(nil, for: .normal)
            sender.isHidden = true
            
            numberButtons[newPosition].setTitle(temp, for: .normal)
            numberButtons[newPosition].isHidden = false
        }
        
        if numberPuzzle.isSolved() {
            messageLabel.text = "********* Congratulations! *********"
            moveCounter = 0
        } else {
            messageLabel.text = "Moves : \(moveCounter)"
        }
        
    }
    
    func syncViewBasedOnModel() {
        for i in 0...15 {
            numberButtons[i].setTitle(String(numberPuzzle.solution[i]), for: .normal)
            numberButtons[i].isHidden = (numberPuzzle.solution[i] == -1) ? true : false
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberPuzzle.randomizePuzzle()
        
        syncViewBasedOnModel()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

