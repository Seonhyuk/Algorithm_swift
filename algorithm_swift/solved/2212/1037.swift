func solution_1037() {
    let _ = Int(readLine()!)!
    var nums = readLine()!.split(separator: " ").map { Int($0)! }

    nums.sort()

    print(nums[0] * nums[nums.count-1])
}
