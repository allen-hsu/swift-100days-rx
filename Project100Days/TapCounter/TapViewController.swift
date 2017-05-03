//
//  TapViewController.swift
//  TapCounter
//
//  Created by Allen Hsu on 2017/5/3.
//  Copyright © 2017年 Allen Hsu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TapViewController: UIViewController {

	@IBOutlet weak var counterNumber: UILabel!
	@IBOutlet weak var tapButton: UIButton!
	
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
			self.counterNumber.text = "\(self.count)"
		}).addDisposableTo(disposeBag)
		
		// Do any additional setup after loading the view, typically from a nib.
		self.tapButton.rx.tap.subscribe(onNext: { [unowned self] _ in
			self.count += 1
			self.counterNumber.text = "\(self.count)"
		}).addDisposableTo(disposeBag)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
