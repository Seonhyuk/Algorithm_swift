import Foundation

func solution_11653() -> Void {
    var n = Int(readLine()!)!

    if n > 1 {
        var primes = Array(repeating: true, count: n+1)
        primes[0] = false
        primes[1] = false

        for i in 2...n {
            if primes[i] {
                for j in stride(from: i*2, to: n+1, by: i) {
                    primes[j] = false
                }
            }
        }

        var t = 2
        while n > 1 {
            if n % t == 0 {
                n /= t
                print(t)
            } else {
                t += 1
            }
            
            if primes[n] || (t > n && n > 1) {
                print(n)
                break
            }
        }
    }
}
