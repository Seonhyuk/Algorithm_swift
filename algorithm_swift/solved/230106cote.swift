func cote_230106_f(_ n: Int, _ k: Int) {
    var check = Array(repeating: false, count: n+1)
    var result = Array(repeating: 0, count: n)
    var cnt = 0
    
    func bruteforce(level: Int) {
        if level == n {
            cnt += 1
            return
        }
        
        for i in 1...n {
            if !check[i] {
                check[i] = true
                result[level] = i
                bruteforce(level: level+1)

                check[i] = false
            }
            
            if cnt == k {
                return
            }
        }
    }
    
    bruteforce(level: 0)
    
    print(result)
}

func cote_230106_f2(_ n: Int, _ k: Int) {
    var result = Array(repeating: 0, count: n)
    var check = Array(repeating: false, count: n+1)
    var factorial = Array(repeating: 1, count: n)
    
    for i in 2..<n {
        factorial[i] = factorial[i-1] * i
    }
    
    func solution(_ n2: Int, _ k2: Int, _ level: Int) {
        if level == n {
            return
        }
        
        let total = factorial[n2-1]
        let mod = k2 / total, rest = k2 % total
        var cnt = 0
        
        for i in 1...n {
            if !check[i] {
                if cnt == mod {
                    result[level] = i
                    check[i] = true
                    break
                }
                cnt += 1
            }
        }
        
        solution(n2-1, rest, level+1)
    }
    
    solution(n, k-1, 0)
    
    print(result)
}
