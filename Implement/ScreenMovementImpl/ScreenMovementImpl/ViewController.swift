//
//  ViewController.swift
//  ScreenMovementImpl
//
//  Created by 이승준 on 2022/07/23.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	// 1. 코드로 화면 이동하기(다른 화면이 코드로 구성되어 있을 때만 가능)
	@IBAction func codeNextBtnTapped(_ sender: UIButton) {
		let firstVC = FirstVC()
		
		// 전체화면으로 화면 이동
		firstVC.modalPresentationStyle = .fullScreen
		firstVC.someString = "문자열 변경하자"
		
		/*
		 firstVC.mainLabel.text? = ""
		 형태로는 구현하지 않도록 주의한다.
		 */
		
		present(firstVC, animated: true, completion: nil)
	}
	
	// 2. 스토리보드와 코드를 함께 활용하여 화면 이동하기
	@IBAction func storyboardWithCodeBtnTapped(_ sender: UIButton) {
		
	}
}

