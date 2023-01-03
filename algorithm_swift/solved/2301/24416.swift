func solution_24416() {
    let n = Int(readLine()!)!
    var dp = [1, 1]
    
    while dp.count < n {
        dp.append(dp[dp.count-1] + dp[dp.count-2])
    }
    
    print("\(dp[dp.count-1]) \(n - 2)")
}
