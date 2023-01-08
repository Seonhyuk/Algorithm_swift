func multiplyMatrix(_ matrix1: [[Int]], _ matrix2: [[Int]]) -> [[Int]] {
    let y = matrix1.count
    let x = matrix2[0].count
    let z = matrix2.count
    
    var result = Array(repeating: Array(repeating: 0, count: x), count: y)
    
    for i in 0..<y {
        for j in 0..<x {
            for k in 0..<z {
                result[i][j] += matrix1[i][k] * matrix2[k][j]
            }
        }
    }
    
    return result
}
