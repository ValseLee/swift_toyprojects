//
//  ViewController.swift
//  DiceGame
//
//  Created by 이승준 on 2022/06/09.
//

import UIKit

class ViewController: UIViewController {
  // embed-in -> stack-view for control several components

  @IBOutlet weak var firstImageView: UIImageView!
  @IBOutlet weak var secondImageView: UIImageView!
  
  // UIImage == Type
  var diceImageArray = [
    UIImage(named:"black1"),
    UIImage(named:"black2"),
    UIImage(named:"black3"),
    UIImage(named:"black4"),
    UIImage(named:"black5"),
    UIImage(named:"black6")
  ]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
  }

  @IBAction func rollButtonTapped(_ sender: UIButton) {
    firstImageView.image = diceImageArray[Int.random(in: 0...5)]
    secondImageView.image = diceImageArray[Int.random(in: 0...5)]

  }
  
}

