func solution_9019() {
    let file = FileIO()
    
    for _ in 0..<file.readInt() {
        let a = file.readInt(), b = file.readInt()
        
        var visited = Array(repeating: false, count: 10000)
        let word = ["1": "D", "2": "S", "3": "L", "4": "R"]
        
        var q: [(Int, Int)] = [(a, 0)]
        var idx = 0
        
        while idx < q.count {
            var (num, path) = q[idx]
            
            visited[num] = true
            
            if num == b {
                var answer = ""
                
                for k in path.description {
                    answer += word[String(k)]!
                }
                
                print(answer)
                break
            }
            
            var newNum = 0
            
            newNum = (num * 2) % 10000
            
            if !visited[newNum] {
                visited[newNum] = true
                q.append((newNum, path * 10 + 1))
            }

            newNum = (num + 9999) % 10000
            
            if !visited[newNum] {
                visited[newNum] = true
                q.append((newNum, path * 10 + 2))
            }
            
            newNum = ((num * 10) % 10000) + (num / 1000)
            
            if !visited[newNum] {
                visited[newNum] = true
                q.append((newNum, path * 10 + 3))
            }

            newNum = (num % 10) * 1000 + num / 10

            if !visited[newNum] {
                visited[newNum] = true
                q.append((newNum, path * 10 + 4))
            }

            idx += 1
        }
    }
}
