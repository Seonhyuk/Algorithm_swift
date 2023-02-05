import Foundation

// swift 시간 초과
func solution_5670() {
    let file = FileIO()
    var res = ""

    while true {
        let n = file.readInt()
        
        if n == 0 {
            break
        }
        
        let trie = Trie<UInt8>()
        var Dict: [[UInt8]] = Array(repeating: [], count: n)
        
        for k in 0..<n {
            let line = file.readStringArr()
            var T = trie
            Dict[k] = line
            
            for i in 0..<line.count {
                if let _ = T.trie[line[i]] {
                    T = T.trie[line[i]]!
                } else {
                    T.trie[line[i]] = Trie()
                    T = T.trie[line[i]]!
                }
            }
            T.isEnd = true
        }
        
        var total: Double = 0
        
        for word in Dict {
            var T = trie.trie[word[0]]!
            var cnt: Double = 1
            
            for i in 1..<word.count {
                if T.trie.count != 1 || T.isEnd {
                    cnt += 1
                }
                T = T.trie[word[i]]!
            }
            
            total += cnt
        }
        
        let result = String(format: "%.2f", total / Double(n))
        res += "\(result)\n"
    }
    print(res)
}
