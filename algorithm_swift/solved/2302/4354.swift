import Foundation

func solution_4354() {
    let file = FileIO()

    func makeLps(pattern: [UInt8]) -> [Int] {
        let lp = pattern.count
        
        var lps = Array(repeating: 0, count: lp)
        var p = 0, i = 1
        
        while i < lp {
            if pattern[p] == pattern[i] {
                p += 1
                lps[i] = p
                i += 1
            } else {
                if p == 0 {
                    lps[i] = 0
                    i += 1
                } else {
                    p = lps[p - 1]
                }
            }
        }
        
        return lps
    }
    
    while true {
        let str = file.readStringArr()
        let length = str.count
        
        if length == 1 && str[0] == 46 { break }
        
        let lps = makeLps(pattern: str)
        let res = length / (length - lps[length - 1])
        
        if length % (length - lps[length - 1]) != 0 {
            print(1)
        } else {
            print(res)
        }
    }
}
