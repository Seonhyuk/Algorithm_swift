func solution_1300() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    
    var start = 1, end = n * n
    var result = 1
    
    while start <= end {
        let mid = (start + end) / 2
        var count = 0
        
        for i in 1...n {
            let c = mid / i
            
            if c > n {
                count += n
            } else {
                count += c
            }
        }

        if count >= k {
            end = mid - 1
            result = mid
        } else {
            start = mid + 1
        }
    }
    
    print(result)
}
