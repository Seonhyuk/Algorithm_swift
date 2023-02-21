import Foundation

// . = 46
// L = 76
// X = 88
// 푸는 중

func solution_3197() {
    let file = FileIO()
    let r = file.readInt(), c = file.readInt()
    
    var matrix: [[UInt8]] = Array(repeating: [], count: r)
    for i in 0..<r { matrix[i] = file.readStringArr() }
    let d = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    var swan: [(Int, Int)] = []
    var willMeltIce: [(Int, Int)] = []
    var check = Array(repeating: Array(repeating: false, count: c), count: r)
    var p = Array(repeating: Array(repeating: 0, count: c), count: r)
    
    for i in 0..<r {
        for j in 0..<c {
            p[i][j] = i * r + j
            if matrix[i][j] != 88 { check[i][j] = true }
        }
    }
    
    for i in 0..<r {
        for j in 0..<c {
            if matrix[i][j] == 76 { swan.append((i, j)) }
            if matrix[i][j] == 88 {
                for direction in d {
                    let di = i + direction.0
                    let dj = j + direction.1
                    
                    if 0..<r ~= di && 0..<c ~= dj && matrix[di][dj] != 88 {
                        willMeltIce.append((i, j))
                        break
                    }
                }
            }
        }
    }
}
