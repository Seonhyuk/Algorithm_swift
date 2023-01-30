func solution_1774() {
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

    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nm[0], m = nm[1]

    var p = Array(0..<n)
    var gods = Array(repeating: (0, 0), count: n)
    var ans: Double = 0

    for i in 0..<n {
        let xy = readLine()!.split(separator: " ").map { Int($0)! }
        let x = xy[0], y = xy[1]
        
        gods[i] = (x, y)
    }

    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0] - 1, b = ab[1] - 1
        
        union(n1: a, n2: b, p: &p)
    }

    var dist: [(Int, Int, Int)] = []

    for i in 0..<(n-1) {
        for j in (i+1)..<n {
            let a = gods[i], b = gods[j]
            let x = a.0 - b.0, y = a.1 - b.1
            let d = x * x + y * y
            
            dist.append((i, j, d))
        }
    }

    dist.sort { $0.2 < $1.2 }

    for d in dist {
        if find(n: d.0, p: &p) != find(n: d.1, p: &p) {
            ans += Double(d.2).squareRoot()
            union(n1: d.0, n2: d.1, p: &p)
        }
    }

    print(String(format: "%.2f", ans))
}
