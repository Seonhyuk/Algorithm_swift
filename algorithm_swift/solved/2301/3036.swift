func solution_3036() {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! }

    for i in 1..<n {
        let k = calcGcd(nums[0], nums[i])
        print("\(nums[0]/k)/\(nums[i]/k)")
    }
}
