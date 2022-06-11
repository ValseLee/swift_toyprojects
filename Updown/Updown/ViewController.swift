//
//  ViewController.swift
//  Updown
//
//  Created by 이승준 on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var topMainLabel: UILabel!
	@IBOutlet weak var numberLabel: UILabel!
	
	@IBOutlet weak var resetBtn: UIButton!
	
	var comChoiceNum = Int.random(in: 1...10)
	var playerChoiceNum = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		resetBtn.isHidden = true
	}
	
	@IBAction func numberBtnTapped(_ sender: UIButton) {
		if playerChoiceNum == 0 {
			numberLabel.text = "Choose Your Number First"
		}
		guard let playerChoiceNumStr = sender.currentTitle else {
			return
		}
		
		numberLabel.text = "You Selected \(playerChoiceNumStr)"
		guard let num = Int(playerChoiceNumStr) else { return }
		playerChoiceNum = num
		
	}
	
	@IBAction func selectBtnTapped(_ sender: UIButton) {
		
		if playerChoiceNum > comChoiceNum {
			topMainLabel.text = "Down"
		} else if playerChoiceNum < comChoiceNum {
			topMainLabel.text = "Up"
		} else {
			topMainLabel.text = "Bingo✨"
			resetBtn.isHidden = false
		}
		
	}
	
	@IBAction func resetBtnTapped(_ sender: UIButton) {
		comChoiceNum = Int.random(in: 1...10)
		playerChoiceNum = 0
		topMainLabel.text = "Choose Your Number"
		numberLabel.text = ""
		resetBtn.isHidden = true
	}
}

