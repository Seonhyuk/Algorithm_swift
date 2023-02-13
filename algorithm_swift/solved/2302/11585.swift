import Foundation

func solution_11585() {
    let file = FileIO()

    let n = file.readInt()
    let meat = file.readNString(n: n)
    let roulette = file.readNString(n: n)
    var ans = 0
    var lps = Array(repeating: 0, count: n)

    var l = 0, pi = 1

    while pi < n {
        if meat[l] == meat[pi] {
            l += 1
            lps[pi] = l
            pi += 1
        } else {
            if l == 0 {
                lps[pi] = 0
                pi += 1
            } else {
                l = lps[l - 1]
            }
        }
    }
        
    var i = 0, j = 0
    let length = n * 2

    while i < length - 1 {
        let newI = i % n
        
        if roulette[newI] == meat[j] {
            i += 1
            j += 1
        } else {
            if j != 0 {
                j = lps[j - 1]
            } else {
                i += 1
            }
        }
        
        if j == n {
            ans += 1
            j = lps[j - 1]
        }
    }

    let gcd = calcGcd(n, ans)

    print("\(ans / gcd)/\(n / gcd)")
}
