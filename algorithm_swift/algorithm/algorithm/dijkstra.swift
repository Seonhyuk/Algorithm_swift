struct DijkstraNode: Comparable {
    var dist = 0
    var from = 0
    
    static func < (a: DijkstraNode, b: DijkstraNode) -> Bool {
        return a.dist < b.dist
    }
    
    init(dist: Int, from: Int) {
        self.dist = dist
        self.from = from
    }
}

func dijkstra(q: Heap<DijkstraNode>, distArray: inout [Int], graph: [Int: [(to: Int, weight: Int)]]) {
    while q.count > 0 {
        let node = q.heappop()!
        
        if distArray[node.from] < node.dist {
            continue
        }
        
        if let nextNodes = graph[node.from] {
            for nxt in nextNodes {
                let nextDist = node.dist + nxt.weight
                if nextDist < distArray[nxt.to] {
                    distArray[nxt.to] = nextDist
                    q.heappush(value: DijkstraNode(dist: nextDist, from: nxt.to))
                }
            }
        }
    }
}

