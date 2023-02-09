import Foundation

func solution_2150() {
    let file = FileIO()

    let v = file.readInt(), e = file.readInt()
    var graph: [Int: [Int]] = [:]
    var stack = [Int]()
    var ids = Array(repeating: 0, count: v + 1)
    var check = Array(repeating: false, count: v + 1)
    var id = 0
    var result = [[Int]]()


    func dfs(_ now: Int) -> Int {
        id += 1
        ids[now] = id
        stack.append(now)
        
        var res = ids[now]
        
        if let vertices = graph[now] {
            for nxt in vertices {
                if ids[nxt] == 0 {
                    res = min(res, dfs(nxt))
                } else if !check[nxt] {
                    res = min(res, ids[nxt])
                }
            }
        }
        
        if res == ids[now] {
            var scc: [Int] = []
            
            while let t = stack.popLast() {
                scc.append(t)
                check[t] = true
                if t == now { break }
            }
            
            scc.sort()
            result.append(scc)
        }
        
        return res
    }

    for _ in 0..<e {
        let a = file.readInt(), b = file.readInt()
        graph[a] != nil ? (graph[a]?.append(b)) : (graph[a] = [b])
    }

    for i in 1...v {
        if ids[i] == 0 { let _ = dfs(i) }
    }

    result.sort { $0[0] < $1[0] }

    print(result.count)
    for line in result {
        for num in line {
            print(num, terminator: " ")
        }
        print("-1")
    }
}
