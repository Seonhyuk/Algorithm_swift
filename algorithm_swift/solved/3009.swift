func solution_3009() {
    var xs: [Int: Int] = [:]
    var ys: [Int: Int] = [:]

    for _ in 0..<3 {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        if xs[edge[0]] != nil {
            xs[edge[0]]! += 1
        } else {
            xs[edge[0]] = 1
        }
        
        if ys[edge[1]] != nil {
            ys[edge[1]]! += 1
        } else {
            ys[edge[1]] = 1
        }
    }

    var answer = [0, 0]

    for item in xs {
        if item.value == 1 {
            answer[0] = item.key
        }
    }

    for item in ys {
        if item.value == 1 {
            answer[1] = item.key
        }
    }

    print("\(answer[0]) \(answer[1])")
}
