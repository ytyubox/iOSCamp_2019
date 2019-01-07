//: [Previous](@previous)
func secondFormat(_ sec:Int )throws ->String {
    //1.時、分、秒
    
    var min:Int = 0
    var hour:Int = 0
    //2.如果秒60、分＋1, 分60、時+1
    
    min = sec/60
    hour = min/60
    var sec:Int = sec
    sec = sec%60
    min = min%60
    return "\(hour):\(min):\(sec)"
}
//: [Next](@next)
