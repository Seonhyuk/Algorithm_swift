import Foundation

func solution_3197() {
    let file = FileIO()
    let r = file.readInt(), c = file.readInt()

    var matrix: [[UInt8]] = Array(repeating: Array(repeating: 0, count: c), count: r)
    var swan: [(Int, Int)] = []
    var day = 0
    var p = Array(0..<(r * c))
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]

    var q = [(Int, Int)]()

    func find(n: Int) -> Int {
        if n != p[n] { p[n] = find(n: p[n]) }
        return p[n]
    }

    func combineWater(_ y: Int, _ x: Int) {
        q.append((y, x))
        let parent = find(n: y * c + x)
        
        for d in directions {
            let dy = y + d.0
            let dx = x + d.1
            if 0..<r ~= dy && 0..<c ~= dx && matrix[dy][dx] == 46 {
                let child = find(n: dy * c + dx)
                p[child] = parent
            }
        }
    }

    func meltIce() {
        let size = q.count
        
        for i in 0..<size {
            let node = q[i]
            
            for d in directions {
                let dy = node.0 + d.0
                let dx = node.1 + d.1
                
                if 0..<r ~= dy && 0..<c ~= dx && matrix[dy][dx] == 88 {
                    matrix[dy][dx] = 46
                    combineWater(dy, dx)
                }
            }
        }
    }

    for i in 0..<r {
        matrix[i] = file.readStringArr()
        
        for j in 0..<c {
            if matrix[i][j] == 76 {
                swan.append((i, j))
                matrix[i][j] = 46
            }
            if matrix[i][j] == 46 {
                combineWater(i, j)
            }
        }
    }

    let swan1 = swan[0].0 * c + swan[0].1
    let swan2 = swan[1].0 * c + swan[1].1

    while q.count > 0 {
        if find(n: swan1) == find(n: swan2) { break }
        
        meltIce()
        day += 1
    }

    print(day)
}
