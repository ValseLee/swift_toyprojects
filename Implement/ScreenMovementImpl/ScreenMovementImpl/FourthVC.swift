//
//  FourthVC.swift
//  ScreenMovementImpl
//
//  Created by 이승준 on 2022/07/23.
//

import UIKit

class FourthVC: UIViewController {
	var someStr: String?
	
	@IBOutlet weak var fourthVCLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		fourthVCLabel.text = someStr
    }
    
	@IBAction func backBtnTapped(_ sender: UIButton) {
		dismiss(animated: true)
	}
	
}
