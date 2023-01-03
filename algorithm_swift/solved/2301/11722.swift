func solution_11722() {
    let _ = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var minDp: [Int] = []

    for num in arr {
        if minDp.count == 0 {
            minDp.append(num)
            continue
        }
        
        let minIdx = bisectLeft(arr: minDp, value: num, asc: false)

        if minIdx == minDp.count {
            minDp.append(num)
        } else {
            minDp[minIdx] = num
        }
    }
    
    print(minDp)
}
