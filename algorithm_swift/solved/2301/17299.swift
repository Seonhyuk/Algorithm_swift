func solution_17299() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var f: [Int: Int] = [:]
    var result = Array(repeating: -1, count: n)
    var stack: [(idx: Int, value: Int)] = []
    
    for num in arr {
        if let _ = f[num] {
            f[num]! += 1
        } else {
            f[num] = 1
        }
    }
    
    for i in 0..<n {
        if stack.count == 0 {
            stack.append((idx: i, value: arr[i]))
            continue
        }
        
        while stack.count > 0 && f[stack[stack.count - 1].value]! < f[arr[i]]! {
            let lastValue = stack.popLast()!
            
            result[lastValue.idx] = arr[i]
        }
        
        stack.append((idx: i, value: arr[i]))
    }
    
    var answer = ""
    
    for i in 0..<n {
        answer += "\(result[i]) "
    }
    
    print(answer)
}
