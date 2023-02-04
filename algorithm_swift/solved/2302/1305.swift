func solution_1305() {
    let L = Int(readLine()!)!
    let ad = Array(readLine() ?? "")

    var lps = Array(repeating: 0, count: L)

    var p = 0
    for i in 1..<L {
        while p > 0 && ad[p] != ad[i] {
            p = lps[p - 1]
        }
        
        if ad[i] == ad[p] {
            p += 1
        }
        
        lps[i] = p
    }

    print(L - lps[L - 1])
}

func solution_1305_2() {
    let L = Int(readLine()!)!
    let ad = Array(readLine() ?? "")
    var lps = Array(repeating: 0, count: L)
    var p = 0, i = 1

    while i < L {
        if ad[p] == ad[i] {
            p += 1
            lps[i] = p
            i += 1
        } else {
            if p == 0 {
                lps[i] = 0
                i += 1
            } else {
                p = lps[p - 1]
            }
        }
    }

    print(L - lps[L - 1])
}
