import Foundation

func solution_13511() {
    let file = FileIO()
    let n = file.readInt()

    var tree: [Int: [(Int, Int)]] = [:]
    var level = Array(repeating: -1, count: n + 1)
    var p = Array(repeating: Array(repeating: (0, 0), count: 18), count: n + 1)

    for _ in 1..<n {
        let u = file.readInt(), v = file.readInt(), w = file.readInt()
        
        tree[u] != nil ? (tree[u]?.append((v, w))) : (tree[u] = [(v, w)])
        tree[v] != nil ? (tree[v]?.append((u, w))) : (tree[v] = [(u, w)])
    }

    level[1] = 0
    var stack = [1]

    while let now = stack.popLast() {
        for nxt in tree[now]! {
            if level[nxt.0] == -1 {
                level[nxt.0] = level[now] + 1
                p[nxt.0][0] = (now, nxt.1)
                stack.append(nxt.0)
            }
        }
    }

    for j in 0..<17 {
        for i in 1...n {
            let b = p[i][j]
            p[i][j + 1] = (p[b.0][j].0, p[b.0][j].1 + b.1)
        }
    }

    var answer = ""

    for _ in 0..<file.readInt() {
        let command = file.readInt()
        var res = 0
        
        if command == 1 {
            var u = file.readInt(), v = file.readInt()
            
            if level[u] > level[v] { swap(&u, &v) }
            let diff = level[v] - level[u]
            
            for i in 0..<18 {
                if diff & (1 << i) != 0 {
                    res += p[v][i].1
                    v = p[v][i].0
                }
            }
            
            while u != v {
                for i in 1..<18 {
                    if p[u][i].0 == p[v][i].0 {
                        res += p[u][i - 1].1 + p[v][i - 1].1
                        u = p[u][i - 1].0
                        v = p[v][i - 1].0
                        break
                    }
                }
            }
        } else {
            var u = file.readInt(), v = file.readInt(), k = file.readInt()
            var left = u, right = v
            var isLeft = false, dist = 0
            var isKLeft = true
            var total = 0
            
            if level[left] > level[right] {
                isLeft = true
                swap(&left, &right)
            }
            
            let diff = level[right] - level[left]

            for i in 0..<18 {
                if diff & (1 << i) != 0 {
                    total += 1 << i
                    right = p[right][i].0
                }
            }

            while left != right {
                for i in 1..<18 {
                    if p[left][i].0 == p[right][i].0 {
                        dist += 1 << (i - 1)
                        left = p[left][i - 1].0
                        right = p[right][i - 1].0
                        break
                    }
                }
            }
            
            let flag = total
            total += dist * 2
            if isLeft { dist += flag }
            
            if k > dist { isKLeft = false }
            
            if isKLeft {
                k -= 1
                for i in 0..<18 {
                    if k & (1 << i) != 0 {
                        u = p[u][i].0
                    }
                }
                res = u
            } else {
                k = total + 1 - k
                
                for i in 0..<18 {
                    if k & (1 << i) != 0 {
                        v = p[v][i].0
                    }
                }
                
                res = v
            }
        }
        answer.write("\(res)\n")
    }

    print(answer, terminator: "")
}
