func solution_10844() {
    let n = Int(readLine()!)!
    
    var dp = Array(repeating: Array(repeating: 1, count: n), count: 10)
    dp[0][0] = 0
    
    for j in 1..<n {
        dp[0][j] = dp[1][j-1]
        for i in 1..<9 {
            dp[i][j] = (dp[i-1][j-1] + dp[i+1][j-1]) % 1000000000
        }
        dp[9][j] = dp[8][j-1]
    }
    
    var result = 0
    for i in 0..<10 {
        result += dp[i][n-1]
        result %= 1000000000
    }
    print(result)
}
