func solution_1934() {
    let t = Int(readLine()!)!

    for _ in 0..<t {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        
        print(nums[0] * nums[1] / calcGcd(nums[0], nums[1]))
    }
}
