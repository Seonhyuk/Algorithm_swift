func solution_2740() {
    let info1 = readLine()!.split(separator: " ").map { Int($0)! }
    var matrix1: [[Int]] = []
    
    for _ in 0..<info1[0] {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        matrix1.append(line)
    }
    
    let info2 = readLine()!.split(separator: " ").map { Int($0)! }
    var matrix2: [[Int]] = []
    
    for _ in 0..<info2[0] {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        matrix2.append(line)
    }
    
    let result = multiplyMatrix(matrix1, matrix2)
    
    for i in 0..<info1[0] {
        for j in 0..<info2[1] {
            print(result[i][j], terminator: " ")
        }
        print()
    }
}
