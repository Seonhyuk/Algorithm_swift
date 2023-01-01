func solution_1010() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        print(combination(info[1], info[0]))
    }
}
