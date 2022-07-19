//
//  ViewController.swift
//  First
//
//  Created by 이승준 on 2022/07/19.
//  초시계 구현
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var secondsViewLabel: UILabel!
	@IBOutlet weak var slider: UISlider!
	
	weak var timer: Timer?
	var num: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
	}

	// MARK: App UI Config
	func configureUI() {
		secondsViewLabel.text = "Start Your Timer"
		slider.value = 0.5
	}
	
	@IBAction func sliderChanged(_ sender: UISlider) {
		// code
		let seconds = Int(slider.value * 60)
		secondsViewLabel.text = "\(seconds) Seconds"
		num = seconds
	}
	
	@IBAction func startBtnTapped(_ sender: UIButton) {
		
		if num != 0 {
			slider.isEnabled = false
			timer?.invalidate()
			timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
				if num > 0 {
					num -= 1
					slider.value = Float(num) / Float(60)
					secondsViewLabel.text = "\(num) Seconds"
				} else {
					num = 0
					secondsViewLabel.text = "Time's Up"
					timer?.invalidate()
					AudioServicesPlaySystemSound(SystemSoundID(1322))
				}
			}
		} else {
			secondsViewLabel.text = "Select Time First"
		}
	}
	
	@IBAction func resetBtnTapped(_ sender: UIButton) {
		slider.setValue(0.5, animated: true)
		slider.isEnabled = true
		secondsViewLabel.text = "Start Your Timer"
		timer = nil
		num = 0
	}
	
}

