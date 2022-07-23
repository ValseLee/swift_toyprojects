//
//  ThirdVC.swift
//  ScreenMovementImpl
//
//  Created by 이승준 on 2022/07/23.
//

import UIKit

class ThirdVC: UIViewController {

	@IBOutlet weak var thirdVCLabel: UILabel!
	
	var someStr: String?
	
	override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
	func configureUI() {
		thirdVCLabel.text = someStr
	}

	@IBAction func backBtnTapped(_ sender: UIButton) {
		dismiss(animated: true)
	}
	
}
