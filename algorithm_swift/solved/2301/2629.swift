func solution_2629() {
    let n = Int(readLine()!)!
    let weight = readLine()!.split(separator: " ").map { Int($0)! }
    
    let _ = Int(readLine()!)!
    let marbles = readLine()!.split(separator: " ").map { Int($0)! }
    let last = n * 500
    
    var check = Array(repeating: Array(repeating: false, count: last + 1), count: n)
    
    check[0][0] = true
    check[0][weight[0]] = true
    
    for i in 1..<n {
        check[i][0] = true
        check[i][weight[i]] = true
        for j in 0...last {
            if check[i-1][j] {
                check[i][j] = true
                check[i][j + weight[i]] = true
            }
        }
    }
    
    var result = ""
    
    for marble in marbles {
        var answer = false
        if marble <= last && check[n - 1][marble] {
            result += "Y "
            continue
        }
        
        for i in 1...last {
            if marble + 2 * i <= last {
                if check[n - 1][marble + 2 * i] && check[n - 1][marble + i] {
                    result += "Y "
                    answer = true
                    break
                }
            } else {
                break
            }
        }
        
        if !answer {
            result += "N "
        }
    }
    
    print(result)
}
