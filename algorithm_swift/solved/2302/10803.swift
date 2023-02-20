func solution_10803() {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    var n = nm[0], m = nm[1]

    if n < m { swap(&n, &m) }

    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

    func getSquare(x: Int, y: Int) -> Int {
        let a = max(x, y)
        let b = min(x, y)
        
        if a % b == 0 { return a / b }
        if a == b { return 1 }
        if dp[a][b] != 0 { return dp[a][b] }
        
        var res = a * b
        
        if a >= 3 * b {
            res = min(res, getSquare(x: a - b, y: b) + 1)
        } else {
            for i in 1...(a / 2) {
                res = min(res, getSquare(x: a - i, y: b) + getSquare(x: i, y: b))
            }
            
            for j in 1...(b / 2) {
                res = min(res, getSquare(x: a, y: b - j) + getSquare(x: a, y: j))
            }
        }
        
        dp[a][b] = res
        
        return res
    }

    let result = getSquare(x: n, y: m)

    print(result)
}
