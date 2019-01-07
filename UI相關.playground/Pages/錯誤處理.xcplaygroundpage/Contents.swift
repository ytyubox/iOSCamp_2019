import Foundation
import XCTest

func secondFormat(_ sec:Int = 0) throws ->String{
	enum error:Error,Equatable{
		case message (String)
	}
	guard sec > -1		else {throw error.message("error: negative number is not allowed")}
	guard sec < 360000	else {throw error.message("error: hour colunm is overflow")}
	
	var result = String()
	var time = sec
	while time > 0{
		result.insert(contentsOf: String(format:"%d%d:",time % 60 / 10 , time % 60 % 10), at: result.startIndex)
		time /= 60
	}
	result.removeLast()
	if result.first == "0"{result.removeFirst()}
	return result
}

XCTAssertEqual(try secondFormat(123), "2:03")
XCTAssertEqual(try secondFormat(60 * 60 * 60 - 1), "59:59:59")







//: [Next](@next)
