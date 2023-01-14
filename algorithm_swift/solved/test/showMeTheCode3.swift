func solved_a() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }

    var left_dp = Array(repeating: 0, count: n)
    var right_dp = Array(repeating: 0, count: n)
    
    for i in 0..<n {
        if arr[i] == 1 {
            if i == 0 {
                left_dp[i] = 1
                continue
            }
            
            left_dp[i] = left_dp[i-1] + 1
            right_dp[i] = max(0, right_dp[i-1] - 1)
            
        } else {
            if i == 0 {
                right_dp[i] = 1
                continue
            }
            
            left_dp[i] = max(0, left_dp[i-1] - 1)
            right_dp[i] = right_dp[i-1] + 1
        }
    }
    
    var answer = 0
    
    for i in 0..<n {
        answer = max(answer, left_dp[i])
        answer = max(answer, right_dp[i])
    }
    
    print(answer)
}


func solved_b() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let n = info[0], m = info[1]
    
    var donutMap: [[Int]] = []
    
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        donutMap.append(line)
    }
    
    let d = [(y: -1, x: 0), (y: 0, x: 1), (y: 1, x: 0), (y: 0, x: -1)]
    var check = Array(repeating: Array(repeating: 0, count: m), count: n)
    var cnt = 1
    
    for i in 0..<n {
        for j in 0..<m{
            if check[i][j] == 0 && donutMap[i][j] == 0 {
                let q = Deque<(y: Int, x: Int)>()
                q.pushBack(element: (y: i, x: j))
                check[i][j] = cnt
                
                while q.count > 0 {
                    let node = q.popLeft()!
                    
                    for t in 0..<4 {
                        var dy = node.y + d[t].y
                        var dx = node.x + d[t].x
                        
                        if dy < 0 { dy += n }
                        else if dy >= n { dy = 0 }
                        else if dx < 0 { dx += m }
                        else if dx >= m { dx = 0 }
                        
                        if donutMap[dy][dx] == 0 && check[dy][dx] == 0 {
                            check[dy][dx] = cnt
                            q.pushBack(element: (y: dy, x: dx))
                        }
                    }
                }
                
                cnt += 1
            }
        }
    }
    
    print(cnt - 1)
}

func solved_c() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let n = info[0], m = info[1], c = info[2]
    
    var C: [[Int]] = []
    for _ in 0..<c {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        C.append(line)
    }
    
    let personality1 = readLine()!.split(separator: " ").map { Int($0)! }
    let personality2 = readLine()!.split(separator: " ").map { Int($0)! }
    
    var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for i in 0..<n {
        let p1 = personality1[i]
        
        for j in 0..<m {
            let p2 = personality2[j]
            let score = C[p1-1][p2-1]
            
            dp[i][j] = max(dp[i][j], score)
            if i > 0 && j > 0 { dp[i][j] = max(dp[i][j], dp[i-1][j-1] + score) }
            if i > 0 { dp[i][j] = max(dp[i][j], dp[i-1][j]) }
            if j > 0 { dp[i][j] = max(dp[i][j], dp[i][j-1]) }
        }
    }
    
    print(dp[n-1][m-1])
}
