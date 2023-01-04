func solution_10986() {
    let n_m = readLine()!.split(separator: " ").map { Int($0)! }
    let n = n_m[0], m = n_m[1]
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var rest = Array(repeating: 0, count: n+1)
    
    var total = 0
    for i in 1...n {
        total += arr[i-1]
        total %= m
        rest[i] = total
    }
    
    var prefix = Array(repeating: 0, count: m)
    for r in rest {
        prefix[r] += 1
    }
    
    var result = 0
    for c in prefix {
        result += c * (c - 1) / 2
    }
    
    print(result)
}
