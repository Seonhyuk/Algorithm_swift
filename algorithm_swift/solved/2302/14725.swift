final class Trie<T: Hashable> {
    var trie: [T: Trie] = [:]
    var isEnd = false
}

func printTrie(t: Trie<String>, level: Int = 0) {
    for nxt in t.trie.keys.sorted() {
        var line = ""
        
        for _ in 0..<level {
            line += "--"
        }
        
        print(line + nxt)
        
        if t.trie[nxt]?.trie.count != 0 {
            printTrie(t: t.trie[nxt]!, level: level + 1)
        }
    }
    
    
}

func solution_14725() {
    let n = Int(readLine()!)!
    let trie = Trie<String>()

    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { String($0) }
        let k = Int(line[0])!
        
        var t = trie
        
        for i in 1...k {
            if !t.trie.contains(where: { $0.key == line[i] }) {
                t.trie[line[i]] = Trie<String>()
            }
            t = t.trie[line[i]]!
        }
    }

    printTrie(t: trie)
}
