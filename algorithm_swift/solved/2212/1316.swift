import Foundation

func solution_1316() -> Void {
    let n = Int(readLine()!)!
    var answer = 0

    for _ in 0..<n {
        let word = readLine()!
        var set = Set<Character>()
        
        var alphabet: Character = " "
        var cnt = 0
        
        for s in word {
            if s == alphabet || !set.contains(s) {
                set.insert(s)
                alphabet = s
                cnt += 1
            }
            else {
                break
            }
        }
        
        if cnt == word.count {
            answer += 1
        }
    }

    print(answer)
}
