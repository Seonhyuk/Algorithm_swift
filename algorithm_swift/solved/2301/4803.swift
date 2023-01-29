func solution_4803() {
    var t = 1
    
    while let info = readLine() {
        let ve = info.split(separator: " ").map { Int($0)! }
        let v = ve[0], e = ve[1]
        
        if v == 0 && e == 0 {
            break
        }
        
        var graph: [Int: [Int]] = [:]
        
        for _ in 0..<e {
            let edge = readLine()!.split(separator: " ").map { Int($0)! }
            let s = edge[0], e = edge[1]
            
            if graph[s] != nil {
                graph[s]?.append(e)
            } else {
                graph[s] = [e]
            }
            
            if graph[e] != nil {
                graph[e]?.append(s)
            } else {
                graph[e] = [s]
            }
        }
        
        var check = Array(repeating: false, count: v + 1)
        var res = 0
        var stack: [(Int, Int)] = []
        
        for i in 1...v {
            if !check[i] {
                var isTree = true
                check[i] = true
                
                stack.append((i, 0))
                
                while let node = stack.popLast() {
                    if let edges = graph[node.0] {
                        for nxt in edges {
                            if !check[nxt] {
                                check[nxt] = true
                                stack.append((nxt, node.0))
                            } else if node.1 != nxt {
                                isTree = false
                            }
                        }
                    }
                }
                
                if isTree {
                    res += 1
                }
            }
        }
        
        if res == 0 {
            print("Case \(t): No trees.")
        } else if res == 1 {
            print("Case \(t): There is one tree.")
        } else {
            print("Case \(t): A forest of \(res) trees.")
        }
        
        t += 1
    }
}
