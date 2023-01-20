func solution_1450() {
    let nc = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, c) = (nc[0], nc[1])
    
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var pre: [Int] = []
    var post: [Int] = []
    
    for i in 0..<(1 << (n/2)) {
        var sum = 0
        for j in 0..<(n/2) {
            if i & (1 << j) == 1 {
                sum += arr[j]
            }
        }

        pre.append(sum)
    }
    
    for i in 0..<(1 << (n - n/2)) {
        var sum = 0
        for j in 0..<(n - n/2) {
            if i & (1 << j) == 1 {
                sum += arr[j + n/2]
            }
        }
        post.append(sum)
    }
    
    var answer = 0
    
    post.sort()
    
    for num in pre {
        let f = c - num
        
        if f < 0 {
            continue
        }
        
        answer += bisectRight(arr: post, value: f) + 1
    }
    
    print(answer)
}
