import Foundation

func solution_2581() -> Void {
    let m = Int(readLine()!)!
    let n = Int(readLine()!)!

    var primes = Array(repeating: true, count: 10001)
    primes[0] = false
    primes[1] = false

    for i in 2...10000 {
        if primes[i] {
            for j in stride(from: i * 2, to: 10001, by: i) {
                primes[j] = false
            }
        }
    }

    var minResult = 0, sumResult = 0

    for i in m...n {
        if primes[i] {
            if minResult == 0 {
                minResult = i
            }
            
            sumResult += i
        }
    }

    if (minResult != 0) {
        print(sumResult)
        print(minResult)
    }
    else {
        print(-1)
    }
}
