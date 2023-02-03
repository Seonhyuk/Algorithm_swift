func solution_2482() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    let INF = 1_000_000_003

    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)

    for i in 0...n {
        dp[0][i] = 1
        dp[1][i] = i
    }

    for i in 1...k {
        for j in 4...n {
            dp[i][j] = (dp[i-1][j-2] + dp[i][j-1]) % INF
        }
    }

    print(dp[k][n])
}
