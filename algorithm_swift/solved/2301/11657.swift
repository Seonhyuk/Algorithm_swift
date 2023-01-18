func solution_11657() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let inf = Int(1e09)
    
    var graph: [Int: [(to: Int, weight: Int)]] = [:]
    
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map { Int($0)! }
        let a = abc[0] - 1, b = abc[1] - 1, c = abc[2]
            
        let edge = (to: b, weight: c)
        if let _ = graph[a] {
            graph[a]?.append(edge)
        } else {
            graph[a] = [edge]
        }
    }
    
    var distance = Array(repeating: inf, count: n)
    var isLoop = false
    distance[0] = 0
    
    for i in 0..<n {
        for edge in graph {
            for nxt in edge.value {
                if distance[edge.key] != inf && distance[nxt.to] > distance[edge.key] + nxt.weight {
                    distance[nxt.to] = distance[edge.key] + nxt.weight
                    
                    if i == n - 1 {
                        isLoop = true
                    }
                }
            }
        }
    }

    if isLoop {
        print(-1)
    } else {
        var answer = ""
        
        for i in 1..<n {
            if distance[i] == Int(1e09) {
                answer += "-1\n"
            } else {
                answer += "\(distance[i])\n"
            }
        }
        
        print(answer)
    }
}
