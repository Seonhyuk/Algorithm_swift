func solution_3273() {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    arr.sort()
    let total = Int(readLine()!)!
    
    var start = 0, end = n - 1, answer = 0
    
    while start < end {
        let sum = arr[start] + arr[end]
        if sum == total {
            answer += 1
            start += 1
            end -= 1
        } else if sum > total {
            end -= 1
        } else {
            start += 1
        }
    }
    
    print(answer)
}

func solution_3273_2() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let total = Int(readLine()!)!
    var answer = 0
    
    var numSet: Set<Int> = []
    
    for num in arr {
        let findNum = total - num
        if numSet.contains(findNum) {
            answer += 1
            numSet.remove(findNum)
        } else {
            numSet.insert(num)
        }
    }
    
    print(answer)
}

