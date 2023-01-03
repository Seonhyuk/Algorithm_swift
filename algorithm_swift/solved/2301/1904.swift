func solution_1904() {
    let n = Int(readLine()!)!
    var dp = [1, 2]
    
    while n > dp.count {
        dp.append((dp[dp.count-1] + dp[dp.count-2]) % 15746)
    }
    
    print(dp[n-1] % 15746)
}
