//
//  FirstVC.swift
//  ScreenMovementImpl
//
//  Created by 이승준 on 2022/07/23.
/*
 1. 왜 이전 화면에서 mainLabel.text? 를 찍어서 데이터를 전달하지 않는가?
	- 코드로만 작성하면 코드 영역과 데이터 영역에 한 번에 컴파일 되어서 올라간다.
	- 그런데 스토리보드는 컴파일 과정이 다르다.
	- 스토리보드와 코드 영역을 연동하는 내부 매커니즘 때문에 mainLabel.text?를 직접 찍어서 올릴 수 없다.
 */

import UIKit

class FirstVC: UIViewController {
	
	// 이전 뷰컨에서 받아오는 문자열
	// 생성자 이슈로 가능하면 옵셔널로 타입 지정만 한다.
	var someString: String?
	
	lazy var mainLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "FirstViewController"
		label.font = UIFont.systemFont(ofSize: 22)
		return label
	}()
	
	lazy var backBtn: UIButton = {
		let btn = UIButton(type: .custom)
		btn.translatesAutoresizingMaskIntoConstraints = false
		btn.setTitle("Back", for: .normal)
		btn.setTitleColor(.white, for: .normal)
		btn.backgroundColor = .blue
		btn.titleLabel?.font = .boldSystemFont(ofSize: 20)
		btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
		return btn
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.addSubview(mainLabel)
		view.addSubview(backBtn)
		
		configureUI()
    }
    
	func configureUI() {
		view.backgroundColor = .gray
		
		mainLabel.text = someString
		
		NSLayoutConstraint.activate([
			mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0),
			mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
			
			backBtn.widthAnchor.constraint(equalToConstant: 70.0),
			backBtn.heightAnchor.constraint(equalToConstant: 40.0),
			backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40.0),
			backBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
		])
		
		
	}
	
	// 단순히 이전 화면으로 돌아가는 메소드는 Apple API로 준비되어 있다!
	@objc func backBtnTapped() {
		dismiss(animated: true, completion: nil)
	}

}
