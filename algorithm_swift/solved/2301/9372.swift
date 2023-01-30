func solution_9372() {
    func find(n: Int, p: inout [Int]) -> Int {
        if n != p[n] {
            p[n] = find(n: p[n], p: &p)
        }
        return p[n]
    }

    func union(n1: Int, n2: Int, p: inout [Int]) {
        let r1 = find(n: n1, p: &p)
        let r2 = find(n: n2, p: &p)
        
        p[r2] = r1
    }

    let file = FileIO()
    let t = file.readInt()

    for _ in 0..<t {
        let n = file.readInt(), m = file.readInt()
        
        var p = Array(0...n)
        var ans = 0
        
        for _ in 0..<m {
            let a = file.readInt(), b = file.readInt()
            
            if find(n: a, p: &p) != find(n: b, p: &p) {
                ans += 1
                union(n1: a, n2: b, p: &p)
            }
        }
        
        print(ans)
    }
}
