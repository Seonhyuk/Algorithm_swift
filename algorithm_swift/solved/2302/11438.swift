import Foundation

func solution_11438() {
    let file = FileIO()
    let n = file.readInt()

    var p = Array(repeating: Array(repeating: 0, count: 18), count: n + 1)
    var level = Array(repeating: -1, count: n + 1)
    var tree: [Int: [Int]] = [:]

    for _ in 1..<n {
        let a = file.readInt(), b = file.readInt()
        
        tree[a] != nil ? (tree[a]?.append(b)) : (tree[a] = [b])
        tree[b] != nil ? (tree[b]?.append(a)) : (tree[b] = [a])
    }

    var stack = [1]
    level[1] = 0

    while let now = stack.popLast() {
        if let nxtList = tree[now] {
            for nxt in nxtList {
                if level[nxt] == -1 {
                    p[nxt][0] = now
                    level[nxt] = level[now] + 1
                    stack.append(nxt)
                }
            }
        }
    }

    for j in 1..<18 {
        for i in 1...n {
            p[i][j] = p[p[i][j-1]][j-1]
        }
    }

    let m = file.readInt()
    var result = ""

    for _ in 0..<m {
        var a = file.readInt(), b = file.readInt()
        if level[a] > level[b] {
            swap(&a, &b)
        }

        while level[a] != level[b] {
            var diff = Int(log2(Double(level[b] - level[a])))
            
            if diff < 0 {
                diff = 0
            }
            
            b = p[b][diff]
        }

        while a != b {
            for i in 1..<18 {
                if p[a][i] == p[b][i] {
                    a = p[a][i-1]
                    b = p[b][i-1]
                    break
                }
            }
        }
        
        result.write("\(a)\n")
    }

    print(result, terminator: "")
}

