func solution_7562() {
    let file = FileIO()
    
    let knight = [
        (y: -2, x: -1),
        (y: -1, x: -2),
        (y: -2, x: 1),
        (y: -1, x: 2),
        (y: 1, x: -2),
        (y: 2, x: -1),
        (y: 1, x: 2),
        (y: 2, x: 1),
    ]
    
    for _ in 0..<file.readInt() {
        let l = file.readInt()
        
        var board = Array(repeating: Array(repeating: 90000, count: l), count: l)
        
        let s = (y: file.readInt(), x: file.readInt())
        let e = (y: file.readInt(), x: file.readInt())
        var check = false
        board[s.y][s.x] = 0
        
        let q = Deque<(y: Int, x: Int)>()
        q.pushBack(element: s)
        
        while q.count > 0 {
            let node = q.popLeft()!
            let current = board[node.y][node.x]
            
            for k in knight {
                let dy = node.y + k.y
                let dx = node.x + k.x
                
                if 0 <= dy && dy < l && 0 <= dx && dx < l {
                    if current + 1 < board[dy][dx] {
                        board[dy][dx] = current + 1
                        if dy == e.y && dx == e.x {
                            check = true
                            break
                        }
                        
                        q.pushBack(element: (y: dy, x: dx))
                    }
                }
            }
            
            if check {
                break
            }
        }
        
        print(board[e.y][e.x])
    }
}
