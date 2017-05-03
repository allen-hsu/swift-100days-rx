//
//  TapOrHoldViewController.swift
//  TapOrHoldCounter
//
//  Created by Allen Hsu on 2017/5/3.
//  Copyright © 2017年 Allen Hsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TapOrHoldViewController: UIViewController {

	@IBOutlet weak var countNumber: UILabel!
	@IBOutlet weak var tabOrHoverButton: UIButton!
	
	private let disposeBag = DisposeBag()
	private var count = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.title = "Counter"
		self.navigationController?.navigationBar.barTintColor = UIColor.white
		self.navigationController?.navigationBar.clipsToBounds = true
		
		let leftButton = UIBarButtonItem(title: "Reset", style: .plain, target: nil, action: nil)
		self.navigationItem.leftBarButtonItem = leftButton

		leftButton.rx.tap.subscribe(onNext: { [unowned self] _ in
			self.count = 0
			self.countNumber.text = "\(self.count)"
		}).addDisposableTo(disposeBag)
		
		// Do any additional setup after loading the view, typically from a nib.
		self.tabOrHoverButton.rx.tap.subscribe(onNext: { [unowned self] _ in
			self.count += 1
			self.countNumber.text = "\(self.count)"
		}).addDisposableTo(disposeBag)
		
		let longPressGesture = UILongPressGestureRecognizer()
		longPressGesture.rx.event
			.subscribe(onNext: { [unowned self] _ in
				self.count += 1
				self.countNumber.text = "\(self.count)"
			}).addDisposableTo(disposeBag)
		self.tabOrHoverButton.addGestureRecognizer(longPressGesture)
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

