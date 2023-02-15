func solution_12104() {
    let file = FileIO()
    let A = file.readStringArr()
    let B = file.readStringArr()
    let n = A.count

    var lps = Array(repeating: 0, count: n)
    var l = 0, r = 1

    while r < n {
        if B[l] == B[r] {
            l += 1
            lps[r] = l
            r += 1
        } else {
            if l == 0 {
                lps[r] = 0
                r += 1
            } else {
                l = lps[l - 1]
            }
        }
    }

    var i = 0, j = 0
    let length = n * 2
    var answer = 0

    while i < length - 1 {
        let newI = i % n
        
        if A[newI] == B[j] {
            i += 1
            j += 1
        } else {
            if j != 0 {
                j = lps[j - 1]
            } else{
                i += 1
            }
        }
        
        if j == n {
            answer += 1
            j = lps[j - 1]
        }
    }

    print(answer)
}
