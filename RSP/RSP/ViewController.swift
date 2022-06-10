//
//  ViewController.swift
//  RSP
//
//  Created by 이승준 on 2022/06/10.
//

import UIKit

class ViewController: UIViewController {
	
	
	// 변수, 속성
	@IBOutlet weak var topMainLabel: UILabel!
	
	@IBOutlet weak var computerImageView: UIImageView!
	@IBOutlet weak var comChoiceLabel: UILabel!
	
	@IBOutlet weak var playerImageView: UIImageView!
	@IBOutlet weak var playerChoiceLabel: UILabel!

	@IBOutlet weak var selectBtn: UIButton!
	@IBOutlet weak var resetBtn: UIButton!
	
	@IBOutlet weak var winStreakTextLabel: UILabel!
	
	var winStreakCnt: Int = 0;
	
	var playerChoice: Rsp = Rsp.rock
	
	// Rsp has Int primitive
	var computerChoice: Rsp = Rsp(rawValue: Int.random(in: 0...2))!
	
	// 함수, 메서드
	override func viewDidLoad() {
		super.viewDidLoad()
		
		computerImageView.image = UIImage(named:"ready")
		comChoiceLabel.text = "Com ready"
		
		playerImageView.image = UIImage(named:"ready")
		playerChoiceLabel.text = "player ready"
		
		resetBtn.isHidden = true
	}
	
	// one func can control several Variables
	@IBAction func rspButtonTapped(_ sender: UIButton) {
		guard let title = sender.currentTitle else {
			return
		}
		switch title {
			case "Rock":
				playerChoice = .rock
			case "Scissors":
				playerChoice = .scissors
			case "Paper":
				playerChoice = .paper
			default:
				break
		}
	}
	
	
	@IBAction func selectButtonTapped(_ sender: UIButton) {
		switch computerChoice {
		case .rock:
			computerImageView.image = UIImage(named:"rock")
			comChoiceLabel.text = "rock"
		case .scissors:
			computerImageView.image = UIImage(named:"scissors")
			comChoiceLabel.text = "scissors"
		case .paper:
			computerImageView.image = UIImage(named:"paper")
			comChoiceLabel.text = "paper"
		}
		
		switch playerChoice {
		case .rock:
			playerImageView.image = UIImage(named:"rock")
			playerChoiceLabel.text = "rock"
		case .scissors:
			playerImageView.image = UIImage(named:"scissors")
			playerChoiceLabel.text = "scissors"
		case .paper:
			playerImageView.image = UIImage(named:"paper")
			playerChoiceLabel.text = "paper"
		}
		
		if computerChoice == playerChoice {
			topMainLabel.text = "Draw!"
		} else if computerChoice == .rock, playerChoice == .paper {
			topMainLabel.text = "Player Wins!"
			winStreakTextLabel.isHidden = false
			winStreakCnt += 1
			winStreakTextLabel.text = "🔥Win Streak : " + String(winStreakCnt)
		} else if computerChoice == .scissors, playerChoice == .rock {
			topMainLabel.text = "Player Wins!"
			winStreakTextLabel.isHidden = false
			winStreakCnt += 1
			winStreakTextLabel.text = "🔥Win Streak : " + String(winStreakCnt)
		} else if computerChoice == .paper, playerChoice == .scissors {
			topMainLabel.text = "Player Wins!"
			winStreakTextLabel.isHidden = false
			winStreakCnt += 1
			winStreakTextLabel.text = "🔥Win Streak : " + String(winStreakCnt)
		} else {
			topMainLabel.text = "Computer Wins!"
			winStreakTextLabel.isHidden = true
			winStreakCnt = 0
		}
		
		
		resetBtn.isHidden = false
		selectBtn.isHidden = true
	}
	
	@IBAction func resetBtnTapped(_ sender: UIButton) {
		computerImageView.image = UIImage(named:"ready")
		comChoiceLabel.text = "ready"
		
		playerImageView.image = UIImage(named:"ready")
		playerChoiceLabel.text = "ready"
		
		topMainLabel.text = "Choose One"
		
		// computer initialize
		computerChoice = Rsp(rawValue: Int.random(in: 0...2))!
		
		// button hide
		resetBtn.isHidden = true
		selectBtn.isHidden = false
	}
}

