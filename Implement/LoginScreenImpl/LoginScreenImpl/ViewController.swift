//
//  ViewController.swift
//  LoginScreenImpl
//	Programmatic Implement : 스토리보드 없이 순수 코드 구현
//  Created by 이승준 on 2022/07/21.
//

import UIKit

class ViewController: UIViewController {
	
	private let textHeight = 48.0
	
	// Config: emailTextFieldView - basic setting
	private lazy var emailTextFieldView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.darkGray
		view.layer.cornerRadius = 10
		view.layer.masksToBounds = true
		
		// Config: emailTextFieldView - add Subview
		view.addSubview(emailTextField)
		view.addSubview(emailInfoLabel)
		return view
	}()
	
	private var emailInfoLabel: UILabel = {
		let label = UILabel()
		label.text = "이메일주소 또는 전화번호"
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.white
		return label
	}()
	
	private lazy var emailTextField: UITextField = {
		var tf = UITextField()
		tf.keyboardType = .emailAddress
		tf.spellCheckingType = .no
		tf.autocorrectionType = .no
		tf.autocapitalizationType = .none
		tf.textColor = .white
		tf.tintColor = .white
		tf.backgroundColor = .clear
		tf.frame.size.height = 48
		return tf
	}()
	
	// Config: passwordTextFieldView - basic setting
	private lazy var passwordTextFieldView: UIView = {
		let view = UIView()
		view.frame.size.height = 48
		view.backgroundColor = UIColor.darkGray
		view.layer.cornerRadius = 10
		view.layer.masksToBounds = true
		
		view.addSubview(passwordTextField)
		view.addSubview(passwordInfoLabel)
		view.addSubview(passwordSecureBtn)
		return view
	}()
	
	private var passwordInfoLabel: UILabel = {
		let label = UILabel()
		label.text = "비밀번호"
		label.font = UIFont.systemFont(ofSize: 10)
		label.textColor = UIColor.white
		return label
	}()
	
	private lazy var passwordTextField: UITextField = {
		var tf = UITextField()
		tf.keyboardType = .emailAddress
		tf.spellCheckingType = .no
		tf.autocorrectionType = .no
		tf.autocapitalizationType = .none
		tf.textColor = .white
		tf.tintColor = .white
		tf.backgroundColor = .clear
		tf.isSecureTextEntry = true
		tf.clearsOnBeginEditing = false
		tf.frame.size.height = 48
		return tf
	}()
	
	private let passwordSecureBtn: UIButton = {
		let btn = UIButton(type: .custom)
		btn.setTitle("X", for: .normal)
		btn.setTitleColor(UIColor.gray, for: .normal)
		btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
		btn.addTarget(self, action: #selector(passwordSecureModeControll), for: .touchUpInside)
		return btn
	}()
	
	// Config: Login Btn
	private let loginBtn: UIButton = {
		let btn = UIButton(type: .custom)
		btn.backgroundColor = .clear
		btn.layer.cornerRadius = 5
		btn.clipsToBounds = true
		btn.layer.borderWidth = 1
		btn.layer.borderColor = #colorLiteral(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
		btn.setTitle("Login", for: .normal)
		btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
		btn.isEnabled = false
		return btn
	}()
	
	// Config: stackView
	private lazy var stackV: UIStackView = {
		let stv = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginBtn])
		stv.axis = .vertical
		stv.alignment = .fill
		stv.distribution = .fillEqually
		stv.spacing = 18
		return stv
	}()
	
	private let passwordResetBtn: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = .clear
		btn.setTitle("Reset Password", for: .normal)
		btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
		btn.addTarget(self, action: #selector(resetBtnTapped), for: .touchUpInside)
		return btn
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}
	
	func configureUI() {
		view.backgroundColor = UIColor.black
		
		// Config: addSubview
		view.addSubview(stackV)
		view.addSubview(passwordResetBtn)
		
		// Config: emailInfoLabel - Auto Layout
		emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		emailTextField.translatesAutoresizingMaskIntoConstraints = false
		
		// Config: passwordInfoLabel - Auto Layout
		passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		passwordSecureBtn.translatesAutoresizingMaskIntoConstraints = false
		passwordResetBtn.translatesAutoresizingMaskIntoConstraints = false
		
		// Config: stackV - Auto Layout
		stackV.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8.0),
			emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8.0),
			emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
			
			emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8.0),
			emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8.0),
			emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
			emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
			
			passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8.0),
			passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8.0),
			passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
			
			passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8.0),
			passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8.0),
			passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15.0),
			passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2.0),
			
			passwordSecureBtn.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15.0),
			passwordSecureBtn.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15.0),
			passwordSecureBtn.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8.0),
			
			passwordResetBtn.topAnchor.constraint(equalTo: stackV.bottomAnchor, constant: 10.0),
			passwordResetBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0),
			passwordResetBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0),
			passwordResetBtn.heightAnchor.constraint(equalToConstant: textHeight),
			
			stackV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			stackV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0),
			stackV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0),
			stackV.heightAnchor.constraint(equalToConstant: textHeight * 3 + 36.0),
		])
	}
	
	@objc func resetBtnTapped() {
		let alert = UIAlertController(title: "Reset Password", message: "Will you reset your Password?", preferredStyle: .alert)
		let success = UIAlertAction(title: "Yes", style: .default) { action in
			print("OK Btn Tapped")
		}
		let cancel = UIAlertAction(title: "No", style: .default) { action in
			print("cancel Btn Tapped")
		}
		alert.addAction(success)
		alert.addAction(cancel)
		
		// To the Next Screen
		present(alert, animated: true) {
			print("Completed")
		}
	}
	
	@objc func passwordSecureModeControll() {
		passwordTextField.isSecureTextEntry.toggle()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

}

