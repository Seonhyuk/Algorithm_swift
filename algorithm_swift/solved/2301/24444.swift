func solution_24444() {
    let file = FileIO()
    let n = file.readInt(), m = file.readInt(), r = file.readInt()
    
    var graph: [Int: [Int]] = [:]
    
    for _ in 0..<m {
        let u = file.readInt(), v = file.readInt()
        
        if let _ = graph[u] {
            graph[u]?.append(v)
        } else {
            graph[u] = [v]
        }
        
        if let _ = graph[v] {
            graph[v]?.append(u)
        } else {
            graph[v] = [u]
        }
    }
    
    for i in 1...n {
        if let _ = graph[i] {
            graph[i]?.sort()
        }
    }
    
    var result = Array(repeating: 0, count: n)
    var visited = Array(repeating: false, count: n)
    var cnt = 1
    
    result[r-1] = cnt
    visited[r-1] = true
    
    let q = Deque<Int>()
    q.pushBack(element: r)
    
    while q.count > 0 {
        let node = q.popLeft()!
        
        if let _ = graph[node] {
            for nex in graph[node]! {
                if !visited[nex-1] {
                    visited[nex-1] = true
                    cnt += 1
                    result[nex-1] = cnt
                    
                    q.pushBack(element: nex)
                }
            }
        }
    }
    
    var answer = ""
    
    for res in result {
        answer += "\(res)\n"
    }
    
    print(answer)
}
