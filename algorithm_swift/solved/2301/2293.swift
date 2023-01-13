import Foundation

func solution_2293() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let k = info[1]
    
    var dp = Array(repeating: 0, count: k+1)
    dp[0] = 1
    
    for _ in 0..<info[0] {
        let coin = Int(readLine()!)!
        
        if coin <= k {
            for i in coin...k {
                if dp[i] + dp[i-coin] >= Int(pow(2.0, 31)) {
                    continue
                }
                
                dp[i] += dp[i - coin]
            }
        }
    }
    
    print(dp[k])
}
