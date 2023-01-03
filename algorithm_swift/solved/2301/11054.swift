func solution_11054() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let revArr = Array(arr.reversed())
    
    var minDp: [Int] = []
    var maxDp: [Int] = []
    var minLength: [Int] = Array(repeating: 1, count: n)
    var maxLength: [Int] = Array(repeating: 1, count: n)

    for i in 0..<n {
        if minDp.count == 0 && maxDp.count == 0 {
            minDp.append(revArr[i])
            maxDp.append(arr[i])
            continue
        }
        
        let idx = bisectLeft(arr: maxDp, value: arr[i])
        let minIdx = bisectLeft(arr: minDp, value: revArr[i])

        if idx == maxDp.count {
            maxDp.append(arr[i])
        } else {
            maxDp[idx] = arr[i]
        }
        
        if minIdx == minDp.count {
            minDp.append(revArr[i])
        } else {
            minDp[minIdx] = revArr[i]
        }
        
        minLength[i] = minDp.count
        maxLength[i] = maxDp.count
    }
    
    var result = 0
    
    for i in 0..<n {
        result = max(result, maxLength[i] + minLength[n-i-1] - 1)
    }
    
    print(result)
}
