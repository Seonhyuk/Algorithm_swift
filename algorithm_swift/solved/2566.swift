func solution_2566() -> Void {
    var maxRowNum = 0, maxColumnNum = 0, maxValue = -1

    var matrix: [[Int]] = []

    for _ in 0..<9 {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        matrix.append(line)
    }

    for i in 0..<9 {
        for j in 0..<9 {
            if matrix[i][j] > maxValue {
                maxValue = matrix[i][j]
                maxRowNum = i + 1
                maxColumnNum = j + 1
            }
        }
    }

    print(maxValue)
    print(maxRowNum, terminator: " ")
    print(maxColumnNum)
}
