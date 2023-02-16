import Foundation

func solution_1097() {
    func kmp(word: [UInt8]) -> Int {
        let length = word.count
        
        var lps = Array(repeating: 0, count: length)
        var l = 0, r = 1
        
        while r < length {
            if word[l] == word[r] {
                l += 1
                lps[r] = l
                r += 1
            } else {
                if l == 0 {
                    lps[r] = 0
                    r += 1
                } else {
                    l = lps[l - 1]
                }
            }
        }
        
        var ans = 0
        var i = 0, j = 0
        let len = length * 2
        
        while i < len - 1 {
            let newI = i % length
            
            if word[newI] == word[j] {
                i += 1
                j += 1
            } else {
                if j != 0 {
                    j = lps[j - 1]
                } else {
                    i += 1
                }
            }
            
            if j == length {
                ans += 1
                j = lps[j - 1]
            }
        }
        
        return ans
    }

    let file = FileIO()
    let n = file.readInt()
    var wordArray: [[UInt8]] = []
    var answer = 0
    var totalLength = 0

    for _ in 0..<n {
        let word = file.readStringArr()
        wordArray.append(word)
        totalLength += word.count
    }

    let k = file.readInt()
    var newWord: [UInt8] = Array(repeating: 0, count: totalLength)
    var check = Array(repeating: false, count: n)

    func bruteForce(level: Int, nextIndex: Int) {
        if level == n {
            let cnt = kmp(word: newWord)
            
            if cnt == k {
                answer += 1
            }
        }
        
        for i in 0..<n {
            if !check[i] {
                check[i] = true
                
                for j in 0..<wordArray[i].count {
                    newWord[nextIndex + j] = wordArray[i][j]
                }
                
                bruteForce(level: level + 1, nextIndex: nextIndex + wordArray[i].count)
                
                check[i] = false
            }
        }
    }

    bruteForce(level: 0, nextIndex: 0)

    print(answer)
}
