//
//  SecondVC.swift
//  ScreenMovementImpl
//
//  Created by 이승준 on 2022/07/23.
/*
 1. Main 스토리보드에서 뷰컨을 하나 새로 생성한 후, 화면을 이동해보자.
 */

import UIKit

class SecondVC: UIViewController {

	@IBOutlet weak var secondVCLabel: UILabel!
	var someStr: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		configureUI()
    }
    
	func configureUI() {
		secondVCLabel.text = someStr
	}

	@IBAction func backBtnTapped(_ sender: UIButton) {
		dismiss(animated: true)
	}
	

}
