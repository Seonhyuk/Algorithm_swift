import Foundation

func solution_3176() {
    let file = FileIO()

    let n = file.readInt()
    var tree = [Int: [(Int, Int)]]()

    for _ in 1..<n {
        let (a, b, c) = (file.readInt(), file.readInt(), file.readInt())
        
        tree[a] != nil ? (tree[a]?.append((b, c))) : (tree[a] = [(b, c)])
        tree[b] != nil ? (tree[b]?.append((a, c))) : (tree[b] = [(a, c)])
    }

    var level: [Int] = Array(repeating: -1, count: n + 1)
    var p: [[(p: Int, max: Int, min: Int)]] = Array(repeating: Array(repeating: (p: 0, max: 0, min: 1000000), count: 18), count: n + 1)

    var stack: [Int] = [1]
    level[1] = 0

    while let now = stack.popLast() {
        for nxt in tree[now]! {
            if level[nxt.0] == -1 {
                level[nxt.0] = level[now] + 1
                p[nxt.0][0] = (p: now, max: nxt.1, min: nxt.1)
                stack.append(nxt.0)
            }
        }
    }

    for j in 0..<17 {
        for i in 1...n {
            p[i][j+1] = (
                p: p[p[i][j].p][j].p,
                max: max(p[p[i][j].p][j].max, p[i][j].max),
                min: min(p[p[i][j].p][j].min, p[i][j].min)
            )
        }
    }

    var answer = ""
    for _ in 0..<file.readInt() {
        var (d, e) = (file.readInt(), file.readInt())
        var maxValue: Int = 0, minValue: Int = 1000000
        
        if level[d] > level[e] {
            swap(&d, &e)
        }
        
        if level[d] != level[e] {
            let dist = level[e] - level[d]
            for i in 0..<18 {
                if dist & (1 << i) != 0 {
                    minValue = min(minValue, p[e][i].min)
                    maxValue = max(maxValue, p[e][i].max)
                    e = p[e][i].p
                }
            }
        }
        
        while d != e {
            for i in 1..<18 {
                if p[d][i].p == p[e][i].p {
                    minValue = min(minValue, p[d][i - 1].min, p[e][i - 1].min)
                    maxValue = max(maxValue, p[d][i - 1].max, p[e][i - 1].max)
                    d = p[d][i - 1].p
                    e = p[e][i - 1].p
                    break
                }
            }
        }
        
        answer.write("\(minValue) \(maxValue)\n")
    }

    print(answer, terminator: "")
}
