func dfs_24480(node: Int, graph: [Int: [Int]], visited: inout [Bool], result: inout [Int], cnt: inout Int) {
    visited[node - 1] = true
    result[node - 1] = cnt
    cnt += 1
    
    if let _ = graph[node] {
        for nex in graph[node]! {
            if !visited[nex - 1] {
                dfs_24480(node: nex, graph: graph, visited: &visited, result: &result, cnt: &cnt)
            }
        }
    }
}

func solution_24480() {
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
            graph[i]?.sort(by: >)
        }
    }
    
    var result = Array(repeating: 0, count: n)
    var visited = Array(repeating: false, count: n)
    var cnt = 1
    var answer = ""
    
    dfs_24480(node: r, graph: graph, visited: &visited, result: &result, cnt: &cnt)
    
    for res in result {
        answer += "\(res)\n"
    }
    
    print(answer)
}
