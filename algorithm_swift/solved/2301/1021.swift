func solution_1021() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    var s = info[0]
    let _ = info[1]
    let command = readLine()!.split(separator: " ").map { Int($0)! }
    var answer = 0
    let q = Deque<Int>()
    
    for i in 1...s {
        q.pushBack(element: i)
    }
    
    for num in command {
        var count = 0
        
        for i in q.firstIndex...q.endIndex {
            if num == q.value(i)! {
                break
            } else {
                count += 1
            }
        }
        
        if count < s - count {
            for _ in 0..<count {
                q.pushBack(element: q.popLeft()!)
            }
            let _ = q.popLeft()
            answer += count
        } else {
            for _ in 0..<(s - count) {
                q.pushFront(element: q.pop()!)
            }
            let _ = q.popLeft()
            answer += s - count
        }
        s -= 1
    }
    
    print(answer)
}
