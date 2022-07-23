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
		// 힙 영역의 스토리보드 인스턴스와 코드를 연결해야 함
		// 스토리보드의 식별자를 설정하여 메소드를 실행하면 UIViewController를 리턴해준다.
		// 그 후에 리턴된 UIViewController를 내가 만든 SecondVC 뷰컨으로 타입캐스팅을 해서 그 내부의 데이터를 쓸 수 있도록 한다.
		let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondVC
		
		secondVC.someStr = "Second 문자열 변경"
		
		// Error: secondVCLabel이 없대요!
		// 스토리보드 객체를 만드는 순간에는 secondVCLabel이 없음
		// 뷰컨 인스턴스가 생성되는 시점과 스토리보드 인스턴스가 생성되는 시점이 다름
		// 뷰컨 인스턴스가 생긴 다음 스토리보드 인스턴스가 생기는데, 이 두 인스턴스가 연결되는 시점이 바로 'viewDidLoad()'
		// 그래서 코드랑 스토리보드가 연결되기 전에 secondVCLabel에 접근해서 값을 넣으면 에러가 리턴
		// secondVC.secondVCLabel.text = "?" 이렇게 구현하지 않도록 주의합시당
		
		
		present(secondVC, animated: true, completion: nil)
	}
}

