func solution_11404() {
    let file = FileIO()
    
    let n = file.readInt()
    let m = file.readInt()
    
    var distance = Array(repeating: Array(repeating: Int.max, count: n + 1), count: n + 1)
    
    for i in 1...n {
        distance[i][i] = 0
    }
    
    var graph: [Int: [(to: Int, weight: Int)]] = [:]
    
    for _ in 0..<m {
        let start = file.readInt(), end = file.readInt(), weight = file.readInt()
        
        let info = (to: end, weight: weight)
        if let _ = graph[start] {
            graph[start]?.append(info)
        } else {
            graph[start] = [info]
        }
    }
    
    let q = Heap<DijkstraNode>()
    var answer = ""
    
    for i in 1...n {
        q.heappush(value: DijkstraNode(dist: 0, from: i))
        
        dijkstra(q: q, distArray: &distance[i], graph: graph)
        
        for j in 1...n {
            if distance[i][j] == Int.max {
                distance[i][j] = 0
            }
            answer += "\(distance[i][j]) "
        }
        answer += "\n"
    }
    
    print(answer)
}
