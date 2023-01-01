func solution_18870() {
    let _ = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! }

    var numList = Array(Set<Int>(nums))
    numList.sort()
    var numDict: [Int: Int] = [:]

    var i = 0
    for num in numList {
        numDict[num] = i
        i += 1
    }

    var result: [String] = []
    for num in nums {
        result.append(String(numDict[num]!))
    }

    print(result.joined(separator: " "))
}
