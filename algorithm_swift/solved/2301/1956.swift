func solution_1956() {
//    let file = FileIO()
//    let v = file.readInt(), e = file.readInt()
    let ve = readLine()!.split(separator: " ").map { Int($0)! }
    let v = ve[0], e = ve[1]

    var distance = Array(repeating: Array(repeating: 1000000000, count: v), count: v)
    
    for _ in 0..<e {
//        let a = file.readInt() - 1, b = file.readInt() - 1, c = file.readInt()
        let abc = readLine()!.split(separator: " ").map { Int($0)! }
        let a = abc[0] - 1, b = abc[1] - 1, c = abc[2]
        
        distance[a][b] = c
    }
    


    for i in 0..<v {
        for j in 0..<v {
            for k in 0..<v {
                distance[i][k] = min(distance[i][k], distance[i][j] + distance[j][k])
            }
        }
    }
    
    var answer = 1000000000
    
    for i in 0..<v {
        answer = min(answer, distance[i][i])
    }
    
    if answer >= 1000000000 {
        answer = -1
    }
    
    print(answer)
}
