func calcDistance(x1: Int, y1: Int, x2: Int, y2: Int) -> Int {
    return (x2-x1) * (x2-x1) + (y2-y1) * (y2-y1)
}

func solution_1004() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        let points = readLine()!.split(separator: " ").map { Int($0)! }
        var answer = 0

        
        let n = Int(readLine()!)!
        for _  in 0..<n {
            let star = readLine()!.split(separator: " ").map { Int($0)! }
            
            let dist1 = calcDistance(x1: points[0], y1: points[1], x2: star[0], y2: star[1])
            let dist2 = calcDistance(x1: points[2], y1: points[3], x2: star[0], y2: star[1])
            let r = star[2] * star[2]
            
            if (dist1 > r && dist2 < r) || (dist1 < r && dist2 > r) {
                answer += 1
            }
        }
        
        print(answer)
    }
}
