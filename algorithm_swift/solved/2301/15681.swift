func solution_15681() {
    func countNode(r: Int, before: Int, dp: inout [Int], graph: [Int: [Int]]) -> Int {
        for nxt in graph[r]! {
            if nxt != before {
                dp[r] += countNode(r: nxt, before: r, dp: &dp, graph: graph)
            }
        }
        
        return dp[r]
    }
    
    let file = FileIO()
    let n = file.readInt(), r = file.readInt(), q = file.readInt()
    var dp = Array(repeating: 1, count: n+1)
    var tree: [Int: [Int]] = [:]
    
    for _ in 1..<n {
        let u = file.readInt(), v = file.readInt()
        
        tree[u] != nil ? (tree[u]?.append(v)) : (tree[u] = [v])
        tree[v] != nil ? (tree[v]?.append(u)) : (tree[v] = [u])
    }
    
    let _ = countNode(r: r, before: 0, dp: &dp, graph: tree)

    for _ in 0..<q {
        let u = file.readInt()
        
        print(dp[u])
    }
}
