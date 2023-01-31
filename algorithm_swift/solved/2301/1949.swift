func solution_1949() {
    let n = Int(readLine()!)!
    let people = readLine()!.split(separator: " ").map { Int($0)! }

    var tree = [Int: [Int]]()
    for _ in 1..<n {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0], b = ab[1]
        
        tree[a] != nil ? (tree[a]?.append(b)) : (tree[a] = [b])
        tree[b] != nil ? (tree[b]?.append(a)) : (tree[b] = [a])
    }

    var containDp = Array(repeating: 0, count: n + 1)
    var notContainDp = Array(repeating: 0, count: n + 1)

    func dfs(_ now: Int, _ p: Int) {
        for nxt in tree[now]! {
            if nxt != p {
                dfs(nxt, now)
            }
        }
        
        containDp[now] = people[now - 1]
        notContainDp[now] = 0
        
        for nxt in tree[now]! {
            if nxt != p {
                containDp[now] += notContainDp[nxt]
                notContainDp[now] += max(notContainDp[nxt], containDp[nxt])
            }
        }
    }

    dfs(1, 0)

    print(max(containDp[1], notContainDp[1]))
}
