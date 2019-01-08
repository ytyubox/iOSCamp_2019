//: [Previous](@previous)

import UIKit
import PlaygroundSupport


protocol Declarative { }
extension Declarative where Self: NSObject {
	init(configureHandler: (Self) -> Void) {
		self.init()
		configureHandler(self)
	}
}
extension NSObject: Declarative { }

class MyTableview:UIViewController{
	override func viewDidLoad() {
		super.viewDidLoad()
		let view = UIView(){
			$0.backgroundColor = .white
			$0.frame = UIScreen.main.bounds
		}
		let label = UILabel() {
			$0.text = "Hello, world!"
			$0.font = $0.font.withSize(30)
			$0.sizeToFit()
		}
		self.view = view
		label.center = view.center
		view.addSubview(label)
		
	}
}

PlaygroundPage.current.liveView = MyTableview()

//: [Next](@next)
