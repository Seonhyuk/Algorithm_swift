func solution_2533() {
    let n = Int(readLine()!)!
    var tree = [Int: [Int]]()

    for _ in 1..<n {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0], b = ab[1]
        
        tree[a] != nil ? (tree[a]?.append(b)) : (tree[a] = [b])
        tree[b] != nil ? (tree[b]?.append(a)) : (tree[b] = [a])
    }

    var containDp = Array(repeating: 0, count: n + 1)
    var notContainDp = Array(repeating: 0, count: n + 1)

    func dfs(now: Int, p: Int) {
        for nxt in tree[now]! {
            if nxt != p {
                dfs(now: nxt, p: now)
            }
        }
        
        containDp[now] = 1
        notContainDp[now] = 0
        
        for nxt in tree[now]! {
            if nxt != p {
                containDp[now] += notContainDp[nxt]
                notContainDp[now] += max(containDp[nxt], notContainDp[nxt])
            }
        }
    }

    dfs(now: 1, p: 0)

    print(n - max(containDp[1], notContainDp[1]))
}
