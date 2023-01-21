func solution_13913() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nk[0], k = nk[1]
    
    var from = Array(repeating: -1, count: 100001)
    from[n] = n
    
    let q = Deque<Int>()
    q.pushBack(element: n)
    
    while let now = q.popLeft() {
        if now == k {
            break
        }
        
        for i in [-1, 1, now] {
            let nxt = now + i
            if 0 <= nxt && nxt <= 100000 && from[nxt] == -1 {
                from[nxt] = now
                q.pushBack(element: nxt)
            }
        }
    }
    
    var now = k
    var answer: [Int] = [k]
    
    while now != n {
        now = from[now]
        answer.append(now)
    }
    
    print(answer.count - 1)
    
    for i in stride(from: answer.count - 1, to: -1, by: -1) {
        print(answer[i], terminator: " ")
    }
}
