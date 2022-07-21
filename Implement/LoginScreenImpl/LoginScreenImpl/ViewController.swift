//
//  ViewController.swift
//  LoginScreenImpl
//	Programmatic Implement : 스토리보드 없이 순수 코드 구현
//  Created by 이승준 on 2022/07/21.
//

import UIKit

class ViewController: UIViewController {
	
	let emailTextFieldView = UIView()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}
	
	func configureUI() {
		// Config: emailTextFieldView - add Subview
		emailTextFieldView.backgroundColor = UIColor.darkGray
		view.addSubview(emailTextFieldView)
		
		// Config: emailTextFieldView - Auto Layout
		emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
		emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0).isActive = true
		emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0).isActive = true
		emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200.0).isActive = true
		emailTextFieldView.heightAnchor.constraint(equalToConstant: 180).isActive = true
		
	}

}

