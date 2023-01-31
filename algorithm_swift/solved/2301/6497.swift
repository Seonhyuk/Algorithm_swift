func solution_6497() {
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

    while true {
        let m = file.readInt(), n = file.readInt()
        
        if m == 0 && n == 0 { break }
        
        var total = 0, s = 0
        var roots: [(Int, Int, Int)] = []
        var p = Array(0...m)
        
        for _ in 0..<n {
            let x = file.readInt(), y = file.readInt(), z = file.readInt()
            roots.append((x, y, z))
        }
        
        roots.sort { $0.2 < $1.2 }
        
        for r in roots {
            total += r.2
            
            if find(n: r.0, p: &p) != find(n: r.1, p: &p) {
                union(n1: r.0, n2: r.1, p: &p)
                s += r.2
            }
        }
        
        print(total - s)
    }
}
