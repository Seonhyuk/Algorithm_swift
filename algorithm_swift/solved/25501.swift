func isPalindrome(_ word: String, _ left: String.Index, _ right: String.Index, _ cnt: inout Int) -> Int {
    cnt += 1
    if left >= right {
        return 1
    }
    else if word[left] == word[right] {
        return isPalindrome(word, word.index(after: left), word.index(before: right), &cnt)
    }
    else {
        return 0
    }
}


func solution_25501() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        let word = readLine()!
        var cnt = 0
        let result = isPalindrome(word, word.startIndex, word.index(before: word.endIndex), &cnt)
        
        print("\(result) \(cnt)")
    }
}
