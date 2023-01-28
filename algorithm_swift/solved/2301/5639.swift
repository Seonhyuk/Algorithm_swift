func solution_5639() {
    var stack: [Int] = []
    
    while let input = readLine(), let n = Int(input) {
        stack.append(n)
    }
    
    func postorder(s: Int, e: Int) {
        if s > e {
            return
        }
        
        var m = e + 1
        
        for i in stride(from: s + 1, through: e, by: 1) {
            if stack[s] < stack[i] {
                m = i
                break
            }
        }
        
        postorder(s: s + 1, e: m - 1)
        postorder(s: m, e: e)
        print(stack[s])
    }
    
    postorder(s: 0, e: stack.count - 1)
}
