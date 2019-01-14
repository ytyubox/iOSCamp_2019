//: [Previous](@previous)


import UIKit
import PlaygroundSupport

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


let pics = (1...5).map { UIImage(named: "pic\($0).jpg")}

class tableVC:UITableViewController{
	let cellid = "cellid"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setCell()
	}
	
	func setCell(){
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellid)
	}
	
	
	override func tableView(_ tableView: UITableView,
							numberOfRowsInSection section: Int) -> Int {
		return pics.count
	}
	override func tableView(_ tableView: UITableView,
							cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath)
		let image = pics[indexPath.item]
		
		cell.imageView?.image = image
		cell.imageView?.anchor(top: view.topAnchor,
							   leading: view.leadingAnchor,
							   bottom: nil,
							   trailing: view.trailingAnchor)
		cell.imageView?.heightAnchor.constraint(equalToConstant: (image?.getRatio())! * tableView.frame.width)
		return cell
	}
	
}
class ImageCell:UITableViewCell{
	let imageView = UIImageView()
}
extension UIImage{
	func getRatio()-> CGFloat{
		return CGFloat(self.size.height) / CGFloat(self.size.width)
	}
}


PlaygroundPage.current.liveView = tableVC()



//: [Next](@next)

