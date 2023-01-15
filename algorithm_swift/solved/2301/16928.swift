func solution_16928() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    
    var board = Array(repeating: 255, count: 100)
    let q = Deque<Int>()
    
    q.pushBack(element: 0)
    board[0] = 0
    
    var snakesOrBridges: [Int: Int] = [:]
    
    for _ in 0..<(info[0] + info[1]) {
        let bridge = readLine()!.split(separator: " ").map { Int($0)! }
        snakesOrBridges[bridge[0] - 1] = bridge[1] - 1
    }
    
    while q.count > 0 {
        let cur = q.popLeft()!
        
        for i in 1...6 {
            let new_cur = cur + i
            
            if new_cur < 100 {
                if let nxt = snakesOrBridges[new_cur] {
                    if board[nxt] > board[cur] + 1 {
                        board[nxt] = board[cur] + 1
                        q.pushBack(element: nxt)
                    }
                } else {
                    if board[new_cur] > board[cur] + 1 {
                        board[new_cur] = board[cur] + 1
                        q.pushBack(element: new_cur)
                    }
                }
            }
        }
    }
    
    print(board[99])
}
