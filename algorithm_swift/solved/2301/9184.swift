func solution_9184() {
    var arr: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 1, count: 21), count: 21), count: 21)
    
    for i in 1...20 {
        for j in 1...20 {
            for k in 1...20 {
                if i < j && j < k {
                    arr[i][j][k] = arr[i][j][k-1] + arr[i][j-1][k-1] - arr[i][j-1][k]
                } else {
                    arr[i][j][k] = arr[i-1][j][k] + arr[i-1][j-1][k] + arr[i-1][j][k-1] - arr[i-1][j-1][k-1]
                }
            }
        }
    }
    
    while true {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        
        if info[0] == -1 && info[1] == -1 && info[2] == -1 {
            break
        }
        
        var result = 0
        if info[0] <= 0 || info[1] <= 0 || info[2] <= 0 {
            result = 1
        } else if info[0] > 20 || info[1] > 20 || info[2] > 20 {
            result = arr[20][20][20]
        } else {
            result = arr[info[0]][info[1]][info[2]]
        }
        
        print("w(\(info[0]), \(info[1]), \(info[2])) = \(result)")
    }
}
