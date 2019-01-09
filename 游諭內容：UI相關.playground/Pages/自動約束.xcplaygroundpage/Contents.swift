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

extension UIView{
	func fillSuperView(){
		anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
	}
	
	func ancherSize(to view:UIView){
		heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
		widthAnchor .constraint(equalTo: view.widthAnchor ).isActive = true
	}
	
	func anchor(top:NSLayoutYAxisAnchor? = nil,
				leading:NSLayoutXAxisAnchor? = nil,
				bottom:NSLayoutYAxisAnchor? = nil,
				trailing:NSLayoutXAxisAnchor? = nil,
				padding : UIEdgeInsets = .zero,
				size:CGSize = .zero) {
		translatesAutoresizingMaskIntoConstraints = false
		if let top = top {
			topAnchor        .constraint(equalTo: top,           constant: padding.top)        .isActive = true}
		if let leading = leading{
			leadingAnchor    .constraint(equalTo: leading,    constant: padding.left)        .isActive = true}
		if let bottom = bottom{
			bottomAnchor    .constraint(equalTo: bottom,     constant: -padding.bottom)    .isActive = true}
		if let trailing = trailing{
			trailingAnchor    .constraint(equalTo: trailing,     constant: -padding.right)    .isActive = true}
		if size .width != 0 {
			widthAnchor.constraint(equalToConstant: size.width).isActive = true}
		if size.height != 0 {
			heightAnchor.constraint(equalToConstant: size.height).isActive = true}
	}
}


class MyVC :UIViewController{
	let boxs:[UIView] = (0...5).map { _ in UIView() }
	override func loadView() {
		let view = UIView() {$0.backgroundColor = .white}
		self.view = view
		boxs.map{view.addSubview($0)}
		
		boxs[0].anchor(top: view.topAnchor,
					   trailing: view.trailingAnchor,
					   padding: .init(top: 10, left: 0, bottom: 0, right: 10),
					   size: .init(width: 100, height: 100))
		boxs[0].backgroundColor = .red
		
		boxs[1].anchor(top: boxs[0].bottomAnchor,
					   trailing: boxs[0].trailingAnchor,
					   padding: .init(top: 10, left: 0, bottom: 0, right: 0))
		boxs[1].backgroundColor = .orange
		
		boxs[2].anchor(top: boxs[1].bottomAnchor,
					   trailing: boxs[1].trailingAnchor,
					   padding: .init(top: 10, left: 0, bottom: 0, right: 0))
		boxs[2].backgroundColor = .yellow
		
		boxs[3].anchor(top: boxs[2].topAnchor,
					   
					   trailing: boxs[2].leadingAnchor,
					   padding: .init(top: 0, left: 0, bottom: 0, right: 10))
		boxs[3].backgroundColor = .green
		
		boxs[4].anchor(top: boxs[3].topAnchor,
					   
					   trailing: boxs[3].leadingAnchor,
					   padding: .init(top: 0, left: 0, bottom: 0, right: 10))
		boxs[4].backgroundColor = .blue
		
		boxs[5].anchor(top: boxs[0].topAnchor,
					   leading: boxs[4].leadingAnchor,
					   bottom: boxs[1].bottomAnchor,
					   trailing: boxs[3].trailingAnchor,
					   padding: .init(top: 0, left: 0, bottom: 0, right: 0))
		boxs[5].backgroundColor = .purple
		boxs[1..<5].map{$0.ancherSize(to: boxs[0])}
	}
}

PlaygroundPage.current.liveView = MyVC()



//: [Next](@next)
