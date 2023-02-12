import Foundation

class Trie_9202<T: Hashable> {
    var trie: [UInt8: Trie_9202] = [:]
    var isEnd = -1
    var word: [UInt8] = []
}

func solution_9202() {
    let file = FileIO()
    let n = file.readInt()
    let trie = Trie_9202<UInt8>()
    let d = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
    var boggle: [[UInt8]] = [[], [], [], []]
    var check = Array(repeating: Array(repeating: false, count: 4), count: 4)
    var checkWord = Array(repeating: false, count: n)
    let points = [
        1: 0, 2: 0, 3: 1, 4: 1, 5: 2, 6: 3, 7: 5, 8: 11
    ]

    var ans = 0
    var maxLengthWord: [UInt8] = []
    var cnt = 0

    func playBoggle(i: Int, j: Int, t: Trie_9202<UInt8>, level: Int) {
        if t.isEnd != -1 && !checkWord[t.isEnd] {
            checkWord[t.isEnd] = true
            ans += points[level]!
            cnt += 1
            
            if t.word.count > maxLengthWord.count {
                maxLengthWord = t.word
            } else if t.word.count == maxLengthWord.count {
                for k in 0..<t.word.count {
                    if t.word[k] < maxLengthWord[k] {
                        maxLengthWord = t.word
                        break
                    } else if t.word[k] > maxLengthWord[k] {
                        break
                    }
                }
            }
        }
        
        if t.trie.keys.count == 0 || level == 8 {
            return
        }
        
        for k in 0..<8 {
            let di = i + d[k].0
            let dj = j + d[k].1
            
            if 0..<4 ~= di && 0..<4 ~= dj && !check[di][dj] {
                if let newT = t.trie[boggle[di][dj]] {
                    check[di][dj] = true
                    playBoggle(i: di, j: dj, t: newT, level: level + 1)
                    check[di][dj] = false
                }
            }
        }
    }

    for i in 0..<n {
        let word = file.readStringArr()
        
        var t = trie
        
        for c in word {
            if t.trie[c] == nil {
                t.trie[c] = Trie_9202<UInt8>()
            }
            t = t.trie[c]!
        }
        t.isEnd = i
        t.word = word
    }

    for _ in 0..<file.readInt() {
        ans = 0
        maxLengthWord = []
        cnt = 0
        checkWord = Array(repeating: false, count: n)
        
        for i in 0..<4 {
            let line = file.readStringArr()
            boggle[i] = line
        }
        
        for i in 0..<4 {
            for j in 0..<4 {
                let t = trie
                
                playBoggle(i: i, j: j, t: t, level: 0)
            }
        }
        
        var str = ""
        for c in maxLengthWord {
            str += String(UnicodeScalar(c))
        }
        
        print(ans, str, cnt)
    }
}
