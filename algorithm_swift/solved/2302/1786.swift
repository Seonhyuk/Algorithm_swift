func kmp(t: String, p: String) -> [Int] {
    let lt = t.count, lp = p.count
    let text = Array(t)
    let pattern = Array(p)
    
    var i = 0, j = 0
    var ans: [Int] = []
    
    var lps = Array(repeating: 0, count: lp)
    
    var l = 0, pi = 1
    
    while pi < lp {
        if pattern[l] == pattern[pi] {
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

    
    while i < lt {
        if text[i] == pattern[j] {
            i += 1
            j += 1
        } else {
            if j != 0 {
                j = lps[j-1]
            } else {
                i += 1
            }
        }
        
        if j == lp {
            ans.append(i - lp + 1)
            j = lps[j - 1]
        }
    }
    
    return ans
}

func solution_1786() {
    let T = readLine()!
    let P = readLine()!

    let res = kmp(t: T, p: P)
    var res2 = ""

    for r in res {
        res2 += "\(r) "
    }

    print(res.count)
    print(res2)
}
