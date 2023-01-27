func preorder(s1: Int, e1: Int, s2: Int, e2: Int, inorder: [Int], postorder: [Int], tree: [Int]) {
    if s1 > e1 || s2 > e2 {
        return
    }
    
    let root = postorder[e2]
    
    let leftNode = tree[root] - s1
    let rightNode = e1 - tree[root]
    
    print(root, terminator: " ")
    preorder(s1: s1, e1: tree[root] - 1, s2: s2, e2: s2 + leftNode - 1, inorder: inorder, postorder: postorder, tree: tree)
    preorder(s1: tree[root] + 1, e1: e1, s2: e2 - rightNode, e2: e2 - 1, inorder: inorder, postorder: postorder, tree: tree)
}

func solution_2263() {
    let n = Int(readLine()!)!
    let inorder = readLine()!.split(separator: " ").map { Int($0)! }
    let postorder = readLine()!.split(separator: " ").map { Int($0)! }
    
    var tree = Array(repeating: 0, count: n + 1)
    
    for i in 0..<n {
        tree[inorder[i]] = i
    }
    
    preorder(s1: 0, e1: n-1, s2: 0, e2: n-1, inorder: inorder, postorder: postorder, tree: tree)
}
