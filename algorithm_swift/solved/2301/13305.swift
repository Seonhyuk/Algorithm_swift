func solution_13305() {
    let n = Int(readLine()!)!
    let dist = readLine()!.split(separator: " ").map { Int($0)! }
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    
    var oil = 0, answer = 0, minCost = 1000000000
    
    for i in 0..<(n-1) {
        if cost[i] < minCost {
            minCost = cost[i]
        }
        
        let need = dist[i] - oil
        
        if need > 0 {
            oil += need
            answer += need * minCost
        }
        
        oil -= dist[i]
    }
    
    print(answer)
}
