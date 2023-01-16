func solution_13549() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let start = info[0], end = info[1]
    
    var loc = Array(repeating: 100000, count: 100001)
    loc[start] = 0
    
    let q = Deque<Int>()
    q.pushBack(element: start)
    
    while q.count > 0 {
        let cur = q.popLeft()!
        
        for i in [-1, 1] {
            let newLoc = cur + i
            if 0 <= newLoc && newLoc <= 100000 && loc[newLoc] > loc[cur] + 1 {
                loc[newLoc] = loc[cur] + 1
                q.pushBack(element: newLoc)
            }
        }
        
        let newLoc = cur * 2
        if 0 <= newLoc && newLoc <= 100000 && loc[newLoc] > loc[cur] {
            loc[newLoc] = loc[cur]
            q.pushFront(element: newLoc)
        }
    }
    
    print(loc[end])
}
