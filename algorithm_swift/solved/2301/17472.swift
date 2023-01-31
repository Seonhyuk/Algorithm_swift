func solution_17472() {
    func find(n: Int, p: inout [Int]) -> Int {
        if n != p[n] {
            p[n] = find(n: p[n], p: &p)
        }
        return p[n]
    }

    func union(n1: Int, n2: Int, p: inout [Int]) {
        let r1 = find(n: n1, p: &p)
        let r2 = find(n: n2, p: &p)
        p[r2] = r1
    }

    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]
    let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

    var map: [[Int]] = []
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }

    var cnt = 1
    var check = Array(repeating: Array(repeating: false, count: m), count: n)

    for i in 0..<n {
        for j in 0..<m {
            if !check[i][j] && map[i][j] == 1 {
                var stack = [(i, j)]
                map[i][j] = cnt
                check[i][j] = true
                
                while let now = stack.popLast() {
                    for d in direction {
                        let dy = now.0 + d.0
                        let dx = now.1 + d.1
                        
                        if 0 <= dy && dy < n && 0 <= dx && dx < m && !check[dy][dx] && map[dy][dx] == 1 {
                            map[dy][dx] = cnt
                            check[dy][dx] = true
                            stack.append((dy, dx))
                        }
                    }
                }
                
                cnt += 1
            }
        }
    }

    var ans = 0
    var p = Array(0..<cnt)
    var roots: [(Int, Int, Int)] = []

    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] != 0 {
                for d in direction {
                    var di = i, dj = j, dist = 0
                    
                    while true {
                        di += d.0
                        dj += d.1
                        dist += 1
                        
                        if di < 0 || di >= n || dj < 0 || dj >= m {
                            break
                        } else if map[di][dj] == 0 {
                            continue
                        } else if map[di][dj] != map[i][j] {
                            if dist < 3 {
                                break
                            }
                            
                            roots.append((map[i][j], map[di][dj], dist - 1))
                            break
                        } else {
                            break
                        }
                    }
                }
            }
        }
    }

    roots.sort { $0.2 < $1.2 }

    for r in roots {
        if find(n: r.0, p: &p) != find(n: r.1, p: &p) {
            union(n1: r.0, n2: r.1, p: &p)
            ans += r.2
        }
    }

    var flag = false
    for i in 2..<cnt {
        let _ = find(n: i - 1, p: &p)
        let _ = find(n: i, p: &p)
        
        if find(n: i - 1, p: &p) != find(n: i, p: &p) {
            flag = true
        }
    }

    if flag {
        print(-1)
    } else {
        print(ans)
    }
}
