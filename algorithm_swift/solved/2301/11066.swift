func solution_11066() {
    let file = FileIO()
    
    for _ in 0..<file.readInt() {
        let n = file.readInt()
        var sum = Array(repeating: 0, count: n+1)
        
        for i in 0..<n {
            sum[i+1] = sum[i] + file.readInt()
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for d in 1..<n {
            for i in 0..<(n-d) {
                let j = d + i
                
                var state = 2147483647
                
                for k in i..<j {
                    state = min(state, dp[i][k] + dp[k+1][j])
                }
                
                dp[i][j] = state + sum[j+1] - sum[i]
            }
        }
        
        print(dp[0][n-1])
    }
}
