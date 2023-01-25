func solution_1967() {
    let n = Int(readLine()!)!
    
    if n == 1 {
        print(0)
        return
    }
    
    var tree: [Int: [(to: Int, w: Int)]] = [:]
    
    for _ in 0..<(n-1) {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        let a = info[0], b = info[1], w = info[2]
        
        if tree[a] == nil {
            tree[a] = [(to: b, w: w)]
        } else {
            tree[a]?.append((to: b, w: w))
        }
        
        if tree[b] == nil {
            tree[b] = [(to: a, w: w)]
        } else {
            tree[b]?.append((to: a, w: w))
        }
    }
    
    var node = 1
    var ans = 0
    
    for _ in 0..<2 {
        var stack = [Int]()
        var check = Array(repeating: false, count: n + 1)
        var dist = Array(repeating: 0, count: n + 1)
        
        stack.append(node)
        check[node] = true
        
        while let v = stack.popLast() {
            for nxt in tree[v]! {
                if !check[nxt.to] {
                    dist[nxt.to] = dist[v] + nxt.w
                    
                    if dist[nxt.to] > ans {
                        ans = dist[nxt.to]
                        node = nxt.to
                    }
                    stack.append(nxt.to)
                    check[nxt.to] = true
                }
            }
        }
    }
    
    print(ans)
}
