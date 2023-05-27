func solution_2668() {
    let n = Int(readLine()!)!
    var arr = [Int]()

    for _ in 0..<n { arr.append(Int(readLine()!)!) }

    var check = Array(repeating: false, count: n + 1)

    for i in 1...n {
        if !check[i] {
            var visited = Array(repeating: false, count: n + 1)
            check[i] = dfs(i: i, start: i, visited: &visited)
        }
    }

    var res = [Int]()

    for i in 1...n {
        if check[i] {
            res.append(i)
        }
    }

    print(res.count)

    for r in res { print(r) }

    func dfs(i: Int, start: Int, visited: inout [Bool]) -> Bool {
        visited[i] = true
        
        if arr[i - 1] == start {
            check[i] = true
            return true
        } else if visited[arr[i - 1]] {
            return false
        } else {
            let res = dfs(i: arr[i - 1], start: start, visited: &visited)
            
            if res {
                check[i] = res
            }
            
            return res
        }
    }
    
}
