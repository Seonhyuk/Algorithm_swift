func solution_15828() {
    let file = FileIO()
    let size = file.readInt()
    let q = Deque<Int>()
    var result = ""
    
    while true {
        let num = file.readInt()
        
        if num == -1 {
            break
        } else if num == 0 {
            let _ = q.popLeft()
        } else {
            if q.count < size {
                q.pushBack(element: num)
            }
        }
    }
    
    if q.isEmpty {
        result = "empty"
    }
    
    while !q.isEmpty {
        result += "\(q.popLeft()!) "
    }
    
    print(result)
}
