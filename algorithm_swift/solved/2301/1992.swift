func solution_1992() {
    let n = Int(readLine()!)!
    
    var matrix: [[Int]] = []
    
    for _ in 0..<n {
        let line = readLine()!.map { Int(String($0))! }
        matrix.append(line)
    }
    
    var result = ""

    func divideVideo(y: Int, x: Int, size: Int) {
        let start = matrix[y][x]
        var check = true
        
        for i in y..<(y + size) {
            for j in x..<(x + size) {
                if matrix[i][j] != start {
                    check = false
                    break
                }
            }
            
            if !check {
                break
            }
        }
        
        if check {
            result += String(start)
        } else {
            result += "("
            
            let newSize = size / 2
            divideVideo(y: y, x: x, size: newSize)
            divideVideo(y: y, x: x + newSize, size: newSize)
            divideVideo(y: y + newSize, x: x, size: newSize)
            divideVideo(y: y + newSize, x: x + newSize, size: newSize)
            result += ")"
        }
    }
    
    divideVideo(y: 0, x: 0, size: n)
    
    print(result)
}
