func solution_9370() {
    let file = FileIO()
    
    for _ in 0..<file.readInt() {
        let n = file.readInt(), m = file.readInt(), t = file.readInt()
        let s = file.readInt(), g = file.readInt(), h = file.readInt()
        
        var graph: [Int: [(to: Int, weight: Int)]] = [:]
        
        for _ in 0..<m {
            let a = file.readInt(), b = file.readInt(), d = file.readInt()
            
            if let _ = graph[a] {
                graph[a]?.append((to: b, weight: d))
            } else {
                graph[a] = [(to: b, weight: d)]
            }
            
            if let _ = graph[b] {
                graph[b]?.append((to: a, weight: d))
            } else {
                graph[b] = [(to: a, weight: d)]
            }
        }
        
        var d = 0
        for node in graph[g]! {
            if node.to == h {
                d = node.weight
                break
            }
        }
        
        var startDistance = Array(repeating: 5000000, count: n + 1)
        var midDistance = Array(repeating: 5000000, count: n + 1)
        var endDistance = Array(repeating: 5000000, count: n + 1)
        startDistance[s] = 0
        midDistance[h] = 0
        endDistance[g] = 0
        
        let q = Heap<DijkstraNode>()
        q.heappush(value: DijkstraNode(dist: 0, from: s))
        dijkstra(q: q, distArray: &startDistance, graph: graph)
        
        q.heappush(value: DijkstraNode(dist: 0, from: h))
        dijkstra(q: q, distArray: &midDistance, graph: graph)
        
        q.heappush(value: DijkstraNode(dist: 0, from: g))
        dijkstra(q: q, distArray: &endDistance, graph: graph)
        
        var answer: [Int] = []
        
        for _ in 0..<t {
            let cand = file.readInt()
            
            let distance1 = startDistance[g] + d + midDistance[cand]
            let distance2 = startDistance[h] + d + endDistance[cand]
            if distance1 == startDistance[cand] || distance2 == startDistance[cand] {
                answer.append(cand)
            }
        }
        
        answer.sort()
        
        var res = ""
        for ans in answer {
            res += "\(ans) "
        }
        
        print(res)
    }
}
