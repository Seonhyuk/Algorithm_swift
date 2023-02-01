func solution_25308() {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    var ans = 0
    var check = Array(repeating: false, count: 8)
    var arr: [Int] = []

    func dfs(l: Int) {
        if l == 8 {
            for i in 0..<8 {
                if Double(arr[i]) * Double(arr[(i+2) % 8]) * Double(2).squareRoot() > Double(arr[(i+1) % 8] * (arr[i] + arr[(i + 2) % 8])) {
                    return
                }
            }
            ans += 1
            return
        }
        
        for i in 0..<8 {
            if !check[i] {
                check[i] = true
                arr.append(ab[i])
                dfs(l: l + 1)
                let _ = arr.popLast()
                check[i] = false
            }
        }
    }

    dfs(l: 0)

    print(ans)
}
