func solution_18258() {
    let file = FileIO()
    let n = file.readInt()
    let q = Deque<Int>()
    var result = ""
    
    for _ in 0..<n {
        let command = file.readString()
        
        switch command {
        case 448:
            q.pushBack(element: file.readInt())
        case 335:
            let value = q.popLeft()
            
            if let value = value {
                result += "\(value)\n"
            } else {
                result += "-1\n"
            }
        case 443:
            result += "\(q.count)\n"
        case 559:
            if q.isEmpty {
                result += "1\n"
            } else {
                result += "0\n"
            }
        case 553:
            let value = q.head
            
            if let value = value {
                result += "\(value)\n"
            } else {
                result += "-1\n"
            }
        case 401:
            let value = q.tail
            
            if let value = value {
                result += "\(value)\n"
            } else {
                result += "-1\n"
            }
        default:
            continue
        }
    }
    
    print(result)
}
