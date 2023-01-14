func solution_1697() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let n = info[0], k = info[1]
    
    var dist = Array(repeating: 100000, count: 100001)
    dist[k] = 0
    
    let q = Deque<(dist: Int, loc: Int)>()
    q.pushBack(element: (dist: 0, loc: k))
    
    while q.count > 0 {
        let node = q.popLeft()!
        
        if node.loc < 100000 && node.dist + 1 < dist[node.loc + 1] {
            dist[node.loc + 1] = node.dist + 1
            q.pushBack(element: (dist: node.dist + 1, loc: node.loc + 1))
        }
        
        if node.loc > 0 && node.dist + 1 < dist[node.loc - 1] {
            dist[node.loc - 1] = node.dist + 1
            q.pushBack(element: (dist: node.dist + 1, loc: node.loc - 1))
        }
        
        if node.loc > 0 && node.loc % 2 == 0 && node.dist + 1 < dist[node.loc / 2] {
            dist[node.loc / 2] = node.dist + 1
            q.pushBack(element: (dist: node.dist + 1, loc: node.loc / 2))
        }
    }
    
    print(dist[n])
}
