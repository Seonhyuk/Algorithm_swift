func solution_1427() {
    var nums = readLine()!.map { Int(String($0))! }
    nums.sort(by: >)
    let result = nums.map { String($0) }
    print(result.joined(separator: ""))
}
