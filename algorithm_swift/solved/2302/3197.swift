import Foundation

func solution_3197() {
    let file = FileIO()

    let r = file.readInt(), c = file.readInt()
    var matrix: [[UInt8]] = []
    for _ in 0..<r { matrix.append(file.readStringArr()) }

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: c), count: r)
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]

    var swan: [(Int, Int)] = []
    var p = Array(0..<(r * c))
    var day = 0

    var q = [(Int, Int)]()
    var melt = [(Int, Int)]()

    func find(n: Int) -> Int {
        if n != p[n] { p[n] = find(n: p[n]) }
        return p[n]
    }

    func union(n1: Int, n2: Int) {
        let r1 = find(n: n1)
        let r2 = find(n: n2)
        p[r2] = r1
    }

    func combineWater(_ y: Int, _ x: Int) {
        var idx = q.count
        
        q.append((y, x))
        visited[y][x] = true
        let root = y * c + x
        
        while idx < q.count {
            let node = q[idx]
            idx += 1
            
            let i = node.0
            let j = node.1
            p[i * c + j] = root
            
            for d in directions {
                let di = i + d.0
                let dj = j + d.1
                
                if 0..<r ~= di && 0..<c ~= dj && !visited[di][dj] {
                    visited[di][dj] = true
                    if matrix[di][dj] == 46 {
                        q.append((di, dj))
                    } else if matrix[di][dj] == 88 {
                        melt.append((di, dj))
                    }
                }
            }
        }
    }

    for i in 0..<r {
        for j in 0..<c {
            if matrix[i][j] == 76 {
                swan.append((i, j))
                matrix[i][j] = 46
                if swan.count == 2 {
                    break
                }
            }
        }
    }

    let swan1 = swan[0].0 * c + swan[0].1
    let swan2 = swan[1].0 * c + swan[1].1

    for i in 0..<r {
        for j in 0..<c {
            if !visited[i][j] && matrix[i][j] == 46 {
                combineWater(i, j)
            }
        }
    }

    while find(n: swan1) != find(n: swan2) {
        var tmp: [(Int, Int)] = []
        var idx = 0
        
        while idx < melt.count {
            let node = melt[idx]
            idx += 1
            let y = node.0, x = node.1
            
            matrix[y][x] = 46
            var point: [Int] = []
            
            for d in directions {
                let dy = y + d.0
                let dx = x + d.1
                if 0..<r ~= dy && 0..<c ~= dx {
                    if !visited[dy][dx] && matrix[dy][dx] == 88 {
                        visited[dy][dx] = true
                        tmp.append((dy, dx))
                    } else if matrix[dy][dx] == 46 {
                        point.append(dy * c + dx)
                    }
                }
            }
            
            for t in point {
                let v = y * c + x
                if find(n: t) != find(n: v) {
                    union(n1: t, n2: v)
                }
            }
        }
        
        melt = tmp
        day += 1
    }

    print(day)
}
