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
 
	- 그렇다면.. 왜 굳이 프로토콜인가? 대리자의 타입을 프로토콜이 아니라 뷰컨 타입을 채택해도 되지 않을까?
	- 뷰컨 타입을 텍스트필드나 테이블뷰 등의 객체 내에 지정할 수 없기 때문.
	- 그래서 각 텍스트필드, 테이블뷰 등의 객체는 객체 자신을 뷰컨에게 대리자 위임하기 위한 Delegate 프로토콜을 갖는다.
	- 그리고 해당 프로토콜의 요구사항들을 메소드로 실행하면서 객체끼리의 쌍방향 소통 및 뷰컨은 객체를 어떻게 컨트롤 할 수 있을지도 개발자가 구현할 수 있다.
	- Delegate는 객체간 소통을 위해서 꼭 필요하다.
	
  2. Responder란 무엇인가?
	- 응답자? UIView 가 상속받은 객체가 UIResponder.
	- 내부적인 응답을 위한 내부적인 메커니즘이 UIResponder에 구현되어 있다.
	- 텍스트필드의 이 메소드를 호출하면 텍스트필드가 첫 응답 객체가 되고, 입력창을 활성화하지 않아도 키보드가 자동으로 화면에 등장한다.
	- 유저가 어떤 것을 먼저 해야 할지 알려주는 게 becomeFirstResponder()
	- 만약 유저가 접하는 화면에 유저가 해야 할 일이 많다면? becomeFirstResponder() 를 통해 어떤 것을 먼저 해야할지 간접적인 안내가 가능하다는 점!
	- 특정 동작이 끝나면 resignFirstResponder()를 써서 유저의 상호작용을 멈출 수 있다.
	- 사용자가 해당 작업을 나중에 하고 싶어서 다른 객체를 클릭하거나 화면을 벗어날 때도 자연스럽게 응답 객체를 숨길 수 있다.
 
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
		textField.becomeFirstResponder()
		textField.clearButtonMode = .always
		textField.returnKeyType = .done
		
		view.backgroundColor = UIColor.gray
	}
	
	// 화면의 탭을 감지하는 메소드로 텍스트필드 바깥을 터치하면 키보드를 숨기기.
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
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
	// 숫자 입력을 방지하고 입력창에 10개 글자까지만 입력하게 한다면?
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		if Int(string) != nil {
			return false
		} else {
			let maxLength = 10
			let currentString = (textField.text ?? "") as NSString
			let newStr: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
			return newStr.length <= maxLength
		}
	}
	
	// Done 버튼을 누르면 키보드를 다시 숨기자.
	@IBAction func submitBtnTapped(_ sender: UIButton) {
		textField.resignFirstResponder()
	}
	

}

