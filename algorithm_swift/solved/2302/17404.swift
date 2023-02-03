func solution_17404() {
    let n = Int(readLine()!)!
    var cost: [[Int]] = []

    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        cost.append(line)
    }

    var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: n), count: 3)
    var ans = Int.max

    for i in 0..<3 {
        dp[i][0][i] = cost[0][i]
        
        for j in 1..<n {
            for k in 0..<3 {
                for t in 0..<3 {
                    if k == t || dp[i][j-1][t] == 0 {
                        continue
                    }
                    
                    if dp[i][j][k] == 0 {
                        dp[i][j][k] = dp[i][j-1][t] + cost[j][k]
                    } else {
                        dp[i][j][k] = min(dp[i][j][k], dp[i][j-1][t] + cost[j][k])
                    }
                    
                }
            }
        }
        
        for j in 0..<3 {
            if i != j {
                ans = min(ans, dp[i][n - 1][j])
            }
        }
    }

    print(ans)
}
