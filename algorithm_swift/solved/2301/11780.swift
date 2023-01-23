func solution_11780() {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    let INF = 1_000_000_000
    
    var distance = Array(repeating: Array(repeating: INF, count: n), count: n)
    var from = Array(repeating: Array(repeating: -1, count: n), count: n)
    
    for _ in 0..<m {
        let abc = readLine()!.split(separator: " ").map { Int($0)! }
        let a = abc[0] - 1, b = abc[1] - 1, c = abc[2]
        
        if distance[a][b] > c {
            distance[a][b] = c
        }
        from[a][b] = a
    }
    
    for i in 0..<n {
        distance[i][i] = 0
        from[i][i] = -1
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if distance[i][j] > distance[i][k] + distance[k][j] {
                    distance[i][k] = distance[i][k] + distance[k][j]
                    from[i][j] = from[k][j]
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if distance[i][j] == INF {
                print(0, terminator: " ")
                continue
            }
            print(distance[i][j], terminator: " ")
        }
        print()
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if from[i][j] == -1 {
                print(0)
                continue
            }
            
            var route: [Int] = []
            var v = j
            
            while i != v {
                route.append(v + 1)
                v = from[i][v]
            }
            
            route.append(i + 1)
            route.reverse()
            
            print(route.count, terminator: " ")
            
            for i in 0..<route.count {
                print(route[i], terminator: " ")
            }
            print()
        }
    }
}
