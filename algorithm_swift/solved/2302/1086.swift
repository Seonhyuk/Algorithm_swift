import Foundation

func solution_1086() {
    let n = Int(readLine()!)!
    var nums: [String] = []
    var length: [Int] = []

    for _ in 0..<n {
        let txt = readLine()!
        nums.append(txt)
        length.append(txt.count)
    }

    let k = Int(readLine()!)!

    var t = Array(repeating: 1, count: 51)
    var r = Array(repeating: 0, count: n)

    for i in 1...50 {
        t[i] = (t[i-1] * 10) % k
    }

    for i in 0..<n {
        for s in nums[i] {
            r[i] = (r[i] * 10 + Int(String(s))!) % k
        }
    }

    let size = 1 << n
    var dp = Array(repeating: Array(repeating: 0, count: k), count: size)
    dp[0][0] = 1

    for i in 0..<size {
        for j in 0..<k {
            if dp[i][j] == 0 {
                continue
            }
            
            for l in 0..<n {
                if (i & (1 << l)) == 0 {
                    let nxt = (j * t[length[l]] + r[l]) % k
                    dp[i | (1 << l)][nxt] += dp[i][j]
                }
            }
        }
    }

    var s = dp[size - 1][0]
    var m = 0

    for i in 0..<k {
        m += dp[size - 1][i]
    }

    if s == m {
        print("1/1")
    } else if s == 0 {
        print("0/1")
    } else {
        let z = calcGcd(s, m)
        s = s / z
        m = m / z
        
        print("\(s)/\(m)")
    }
}
