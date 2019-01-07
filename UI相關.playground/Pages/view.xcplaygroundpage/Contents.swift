//: A UIKit based Playground for presenting user interface

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


// Present the view controller in the Live View window
let vc = UIViewController{
	$0.preferredContentSize = $0.view.frame.size
	$0.view.backgroundColor = .white
}
let label = UILabel {
	$0.translatesAutoresizingMaskIntoConstraints = false
	$0.frame = CGRect(x: 200, y: 250, width: 500, height: 100)
	$0.textColor = .black
	$0.text = "這裡是playground! 😁😁"
	$0.font = $0.font.withSize(30)
}
vc.view.addSubview(label)


PlaygroundPage.current.liveView = vc

