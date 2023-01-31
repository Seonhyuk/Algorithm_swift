func solution_2213() {
    let n = Int(readLine()!)!
    let weights = readLine()!.split(separator: " ").map { Int($0)! }
    var tree = [Int: [Int]]()

    var containDp = Array(repeating: 0, count: n + 1)
    var notContainDp = Array(repeating: 0, count: n + 1)

    for _ in 1..<n {
        let ab = readLine()!.split(separator: " ").map { Int($0)! }
        let a = ab[0], b = ab[1]
        
        tree[a] != nil ? (tree[a]?.append(b)) : (tree[a] = [b])
        tree[b] != nil ? (tree[b]?.append(a)) : (tree[b] = [a])
    }

    func dfs(i: Int, p: Int) {
        for nxt in tree[i]! {
            if nxt != p {
                dfs(i: nxt, p: i)
            }
        }
        
        notContainDp[i] = 0
        containDp[i] = weights[i - 1]
        
        for nxt in tree[i]! {
            if nxt != p {
                notContainDp[i] += max(containDp[nxt], notContainDp[nxt])
                containDp[i] += notContainDp[nxt]
            }
        }
    }

    dfs(i: 1, p: 0)

    var ans: [Int] = []
    var stack: [(Int, Int, Bool)] = []
    var isContain = false

    if containDp[1] >= notContainDp[1] {
        isContain = true
    }

    print(isContain ? containDp[1] : notContainDp[1])

    stack.append((1, 0, isContain))

    while let node = stack.popLast() {
        if node.2 {
            ans.append(node.0)
        }
        
        for nxt in tree[node.0]! {
            if nxt != node.1 {
                if node.2 {
                    stack.append((nxt, node.0 ,false))
                } else if containDp[nxt] >= notContainDp[nxt] {
                    stack.append((nxt, node.0, true))
                } else {
                    stack.append((nxt, node.0, false))
                }
            }
        }
    }

    ans.sort()
    print(ans.reduce("") { $0 + "\($1) " })
}
