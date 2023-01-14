func solution_3015() {
    let file = FileIO()
    
    let n = file.readInt()
    
    var stack: [(num: Int, cnt: Int)] = []
    var answer = 0

    for _ in 0..<n {
        let height = file.readInt()
        
        while stack.count > 0 && height > stack[stack.count - 1].num {
            let t = stack.popLast()!
            
            answer += t.cnt
        }
        
        if stack.count > 0 && height == stack[stack.count - 1].num {
            answer += stack[stack.count - 1].cnt
            
            if stack[0].num != height {
                answer += 1
            }
            
            stack[stack.count - 1].cnt += 1
        } else {
            if stack.count > 0 {
                answer += 1
            }
    
            stack.append((num: height, cnt: 1))
        }
    }
    
    print(answer)
}
