func solution_16139() {
    let str = readLine()!
    
    var strDict: [String: [Int]] = [:]
    var strCnt: [String: Int] = [:]
    
    for a in "abcdefghijklmnopqrstuvwxyz" {
        let b = String(a)
        strCnt[b] = 0
        strDict[b] = Array(repeating: 0, count: str.count + 1)
    }
    
    var idx = str.endIndex
    
    for i in stride(from: str.count-1, to: -1, by: -1) {
        idx = str.index(before: idx)
        strCnt[String(str[idx])]! += 1
        
        for key in strCnt.keys {
            strDict[key]![i] = strCnt[key]!
        }
    }
    
    let q = Int(readLine()!)!
    var result = ""
    
    for _ in 0..<q {
        let query = readLine()!.split(separator: " ")
        let alpha = String(query[0])
        let start = Int(query[1])!, end = Int(query[2])!
        
        result += "\(strDict[alpha]![start] - strDict[alpha]![end+1])\n"
    }
    
    print(result)
}
