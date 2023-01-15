func solution_1707() {
    let file = FileIO()
    var result = ""

    for _ in 0..<file.readInt() {
        let v = file.readInt(), e = file.readInt()
        
        var graph: [Int: [Int]] = [:]
        
        for _ in 0..<e {
            let a = file.readInt(), b = file.readInt()
            
            if let _ = graph[a] {
                graph[a]?.append(b)
            } else {
                graph[a] = [b]
            }
            
            if let _ = graph[b] {
                graph[b]?.append(a)
            } else {
                graph[b] = [a]
            }
        }
        
        var first: Set<Int> = []
        var second: Set<Int> = []
        var answer = "YES"
        var escape = false
        
        for i in 1...v {
            if first.contains(i) || second.contains(i) {
                continue
            }
            
            let q = Deque<Int>()
            q.pushBack(element: i)
            first.insert(i)
            var check = false
            
            while q.count > 0 {
                let node = q.popLeft()!
                
                if first.contains(node) {
                    check = true
                } else {
                    check = false
                }
                
                if let _ = graph[node] {
                    for nxt in graph[node]! {
                        if check && first.contains(nxt) {
                            answer = "NO"
                            escape = true
                            break
                        } else if !check && second.contains(nxt) {
                            answer = "NO"
                            escape = true
                            break
                        }
                        
                        if !(first.contains(nxt) || second.contains(nxt)) {
                            if check {
                                second.insert(nxt)
                                q.pushBack(element: nxt)
                            } else {
                                first.insert(nxt)
                                q.pushBack(element: nxt)
                            }
                        }
                    }
                }
                
                if escape {
                    break
                }
            }
            
            if escape {
                break
            }
        }

        result += answer + "\n"
    }
    
    print(result)
}
