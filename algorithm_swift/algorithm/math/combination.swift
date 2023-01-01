func combination(_ n: Int, _ r: Int) -> Int {
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: r+1)
    
    for i in 0...n {
        dp[0][i] = 1
    }
    
    for i in 1...r {
        for j in i...n {
            dp[i][j] = dp[i][j-1] + dp[i-1][j-1]
        }
    }
    
    return dp[r][n]
}
