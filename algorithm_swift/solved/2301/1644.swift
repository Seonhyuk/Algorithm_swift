func solution_1644() {
    let n = Int(readLine()!)!
    
    if n == 1 {
        print(0)
        return
    }
    
    var answer = 0
    
    var primes = Array(repeating: true, count: n + 1)
    var arr: [Int] = []
    primes[0] = false
    primes[1] = false
    
    for i in 2...n {
        if primes[i] {
            arr.append(i)
            for j in stride(from: i * 2, through: n, by: i) {
                primes[j] = false
            }
        }
    }
    
    var start = 0, end = 0
    var total = arr[0]
    
    while start <= end && end < arr.count {
        if total == n {
            answer += 1
            total -= arr[start]
            start += 1
        } else if total < n {
            end += 1
            if end < arr.count {
                total += arr[end]
            }
        } else if total > n {
            total -= arr[start]
            start += 1
        }
    }
    
    print(answer)
}
