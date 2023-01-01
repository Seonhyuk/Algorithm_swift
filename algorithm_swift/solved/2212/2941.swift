import Foundation

func solution_2941() -> Void {
    let alphabet: Set = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
    var answer = 0

    let input = readLine()!
    var idx = input.startIndex

    while idx < input.endIndex {
        if idx == input.index(before: input.endIndex) {
            answer += 1
            break
        }
        
        let nextIdx = input.index(after: idx)
        let twoNextIdx = input.index(after: nextIdx)
        var word = String(input[idx...nextIdx])

        if alphabet.contains(word) {
            answer += 1
            idx = twoNextIdx
        }
        else if word == "dz" && nextIdx < input.index(before: input.endIndex) {
            word = String(input[idx...twoNextIdx])
            if word == "dz=" {
                answer += 1
                idx = input.index(after: twoNextIdx)
            }
            else {
                idx = input.index(after: idx)
                answer += 1
            }
        }
        else {
            idx = input.index(after: idx)
            answer += 1
        }
    }

    print(answer)
}
