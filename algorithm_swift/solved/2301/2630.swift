func solution_2630() {
    let n = Int(readLine()!)!
    var paper: [[Int]] = []
    
    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        paper.append(line)
    }
    
    var blue = 0, white = 0
    
    func dividePaper(x: Int, y: Int, size: Int) {
        let start = paper[y][x]
        var check = true
        
        for i in y..<(y+size) {
            for j in x..<(x+size) {
                if paper[i][j] != start {
                    check = false
                    break
                }
            }
            
            if !check {
                break
            }
        }
        
        if check {
            if start == 1 {
                blue += 1
            } else {
                white += 1
            }
        } else {
            let newSize = size / 2
            dividePaper(x: x, y: y, size: newSize)
            dividePaper(x: x, y: y + newSize, size: newSize)
            dividePaper(x: x + newSize, y: y, size: newSize)
            dividePaper(x: x + newSize, y: y + newSize, size: newSize)
        }
    }
    
    dividePaper(x: 0, y: 0, size: n)
    
    print(white)
    print(blue)
}
