func dfs_1167(_ idx: Int, _ v: Int, tree: [Int: [(to: Int, weight: Int)]]) -> (Int, Int) {
    var maxNode = 0, maxValue = 0
    var dist = Array(repeating: 0, count: v + 1)
    var check = Array(repeating: false, count: v + 1)
    check[idx] = true
    
    var stack = [Int]()
    stack.append(idx)
    
    while let node = stack.popLast() {
        for nxt in tree[node]! {
            let d = dist[node] + nxt.weight
            
            if !check[nxt.to] {
                if d > maxValue {
                    maxValue = d
                    maxNode = nxt.to
                }
                
                dist[nxt.to] = d
                check[nxt.to] = true
                stack.append(nxt.to)
            }
        }
    }
    
    return (maxNode, maxValue)
}

func solution_1167() {
    let file = FileIO()
    
    let v = file.readInt()
    
    var tree: [Int: [(to: Int, weight: Int)]] = [:]
    
    for _ in 0..<v {
        let node = file.readInt()
        
        while true {
            let i = file.readInt()
            if i == -1 { break }
            
            if tree[node] == nil {
                tree[node] = [(to: i, weight: file.readInt())]
            } else {
                tree[node]?.append((to: i, weight: file.readInt()))
            }
        }
    }
    
    let (nxt, _) = dfs_1167(1, v, tree: tree)
    let (_, answer) = dfs_1167(nxt, v, tree: tree)
    
    print(answer)
}
