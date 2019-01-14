//: [Previous](@previous)

import UIKit
import PlaygroundSupport

struct Contact {
	let name:String
	var phone:Phone
	
	 enum Phone {
		case Mobile(Int)
		case Home(String)
		case defaults
	}
	private static let names =
		["Love", "Andrew", "Red", "Lila", "Faith", "Lily", "Art", "Robert", "Kayla", "Justice", "Hope", "Madison", "Lucas", "Alexis", "Lisa", "Vanessa", "Kimberly", "Amber", "Jack", "Ann", "Taylor", "Scott", "Amelia"]
	
	private static var contacts : [Contact] = names.sorted().map{ Contact.init(name: $0, phone: .defaults)}
	private static func getKVHashMap()-> [String:[Contact]]{
		return Dictionary(grouping: contacts) {String($0.name.uppercased().first!)}
	}
	static func getKeysfromKVMap()-> [String]{
		let dic = getKVHashMap()
		let locale = Locale(identifier: "zh_TW")
		return Array(dic.keys.sorted(by: { $0.compare($1, locale: locale) == ComparisonResult.orderedAscending}))
	}
	static func get2DarraywithAscendingOrding()->[[Contact]]
	{
		let dic = getKVHashMap()
		let keys = getKeysfromKVMap()
		return keys.map{return dic[$0]!}
	}
}

class VC :UITableViewController{
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
	}
	override func numberOfSections(in tableView: UITableView) -> Int { return Contact.get2DarraywithAscendingOrding().count	}
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {return Contact.getKeysfromKVMap()[section]	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return Contact.get2DarraywithAscendingOrding()[section].count	}
	override func sectionIndexTitles(for tableView: UITableView) -> [String]? {	return Contact.getKeysfromKVMap()	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell  = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
		cell.textLabel?.text = Contact.get2DarraywithAscendingOrding()[indexPath.section][indexPath.row].name
		return cell
	}
}

PlaygroundPage.current.liveView = VC()


//: [Next](@next)
