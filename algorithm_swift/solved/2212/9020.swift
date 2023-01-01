import Foundation

func solution_9020() -> Void {
    let t = Int(readLine()!)!

    var primes = Array(repeating: true, count: 10001)
    primes[0] = false
    primes[1] = false

    for i in 2...10000 {
        if primes[i] {
            for j in stride(from: i*2, to: 10001, by: i) {
                primes[j] = false
            }
        }
    }

    for _ in 0..<t {
        let n = Int(readLine()!)!
        
        var partition = n / 2
        
        while true {
            if primes[abs(n-partition)] && primes[partition] {
                if n - partition < partition {
                    print("\(n-partition) \(partition)")
                } else {
                    print("\(partition) \(n-partition)")
                }
                break
            } else {
                partition -= 1
            }
        }
    }
}
