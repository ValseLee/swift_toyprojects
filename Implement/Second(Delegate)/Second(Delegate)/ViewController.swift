//
//  ViewController.swift
//  Second(Delegate)
//
//  Created by 이승준 on 2022/07/20.


/*
  [구현 목적]
  1. 델리게이트 패턴이란 무엇이며 델리게이트 패턴이 왜 필요한가?
	- 뷰컨트롤러와 별개로 존재하는 객체인 텍스트필드.
	- 유저와 커뮤니케이션하는 텍스트필드는 동작의 결과를 뷰컨에 전달한다.
	- 그러나 유저의 동작은 종류가 매우 다양하다.
	- 그래서 '뷰'와 '유저의 동작'을 이어주어야 한다.
	- 텍스트필드의 동작을 대리해서 뷰컨으로 전달하는 과정이 '델리게이트'.
	- 유저의 행동을 받는 UI의 델리게이트 프로토콜을 채택해서 델리게이트 패턴 구현이 가능.
 
	- Delegate는 객체간 소통을 위해서 꼭 필요하다.
	
  2. Responder란 무엇인가?
 */

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var submitBtn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}

	func configureUI() {
		submitBtn.titleLabel?.minimumScaleFactor = 0.5
		submitBtn.titleLabel?.adjustsFontSizeToFitWidth = true
		
		// textField의 대리자를 ViewController 클래스로 설정
		textField.delegate = self
		
		textField.placeholder = "Your Email"
		textField.keyboardType = UIKeyboardType.emailAddress
		textField.borderStyle = .roundedRect
		textField.clearButtonMode = .always
		textField.returnKeyType = .done
		
		view.backgroundColor = UIColor.gray
	}
	
	// textField 입력이 시작될 때 호출되어, 작성을 허락
	func textFieldShouldBeginEditing(_ textFiled: UITextField) -> Bool {
		return true
	}
	
	// textField 입력칸이 활성화된 시점을 확인
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("입력 시작", #function)
	}
	
	func textFieldShouldClear(_ textField: UITextField) -> Bool {
		return true
	}
	
	// enter 키를 통해 다음 동작으로 이어가게 할 것인지 허락 유무 리턴
	// 이메일 정규표현식을 입력했을 때에만 다음 동작으로 이어갈 수 있도록 구성
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		let emailRegex = #".*@.*\..*"#
		if textField.text == "" {
			textField.placeholder = "Type Your Email First"
			return false
		} else if textField.text != "" {
			if let _ = textField.text!.range(of: emailRegex, options: [.regularExpression]) {
				return true
			}
		}
		return false
	}
	
	// textField 의 입력이 끝날 때 호출하여 입력 종료 여부를 리턴
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		return true
	}
	
    // textField 의 입력이 실제 끝났을 때 호출하여 시점 확인
	func textFieldDidEndEditing(_ textField: UITextField) {
		print("입력 종료", #function)
	}
	
	// TextField 글자가 하나씩 입력되거나 지워질 때 호출, 텍스트필드의 작성 허락 유무 리턴
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		print(string)
		return true
	}
	
	@IBAction func submitBtnTapped(_ sender: UIButton) {
	}
	

}

