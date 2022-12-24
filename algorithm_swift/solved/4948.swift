import Foundation

func solution_4948() -> Void {
    var primes = Array(repeating: true, count: 246913)
    primes[0] = false
    primes[1] = false

    for i in 2...246912 {
        if primes[i] {
            for j in stride(from: i*2, to: 246913, by: i) {
                primes[j] = false
            }
        }
    }

    var primesCnt = Array(repeating: 0, count: 246913)

    var cnt = 0

    for i in 2...246912 {
        if primes[i] {
            cnt += 1
        }
        
        primesCnt[i] = cnt
    }

    while true {
        var n = Int(readLine()!)!
        
        if n == 0 {
            break
        }
        
        print(primesCnt[2*n] - primesCnt[n])
    }
}
