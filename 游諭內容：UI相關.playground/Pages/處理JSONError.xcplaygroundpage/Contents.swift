//: [Previous](@previous)

import Foundation
/**
當讀取JSON時有可能會讀取到兩種或兩種以上的的格式時,可以用單一韓式一次處理序列化,但是越多處理情形將會耗費資源｡
*/

///第一種JSON
let json_Data_1 = """
{
    "result": true,
	"response": {
        "key1": "😁value1",
        "key2": "😁value2"
    }
}
""".data(using: .utf8)!

/// 第二種JSON
let json_Data_2 = """
{
    "result": false,
	"response": "🙅🏼‍♂️Error Message"
}
""".data(using: .utf8)!
///第一種Codable的JSON資料結構
struct JSON_1:Codable{
	var result:Bool
	var response:Response
	struct Response:Codable{
		var key1:String
		var key2:String
	}
}
///第二種Codable的JSON資料結構
struct JSON_2:Codable{
	var result:Bool
	var response:String
}

/// 處理兩種可能的JSON格式，如果都不成功時，只會將最後參數的解析錯誤回報
///
/// - Parameters:
///   - SType: 第一個JSON的資料結構
///   - FType: 第二個JSON的資料結構
///   - data: 要被解析的二元碼資料
///   - decoder: 解析的主要執行者，預設為JSONDecoder()
/// - Returns: 依照順序最先解析成功的資料物件
func jsonErrorDecoder<S:Codable,F:Codable>(SType:S.Type, FType:F.Type,
										   from data:Data,
										   decoder:JSONDecoder = JSONDecoder())
										   throws->Codable{
	let s_feedBack = try? JSONDecoder().decode(SType, from: data)
	guard s_feedBack == nil else {return (s_feedBack!)}
	
	let e_feedBack = try JSONDecoder().decode(FType, from: data)
	
	return(e_feedBack)
	
}

for data in [json_Data_1, json_Data_2]
{
	let result = try! jsonErrorDecoder(SType: JSON_1.self, FType: JSON_2.self, from: data)
	print(result)
}
















/**
輸出結果：
````
JSON_1(result: true, response: Response(key1: "😁value1", key2: "😁value2"))
JSON_2(result: false, response: "🙅🏼‍♂️Error Message")
````

*/



//: [Next](@next)
