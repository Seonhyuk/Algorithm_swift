func solution_1269() {
    let _ = readLine()!.split(separator: " ").map { Int($0) }
    var aSet = Set<Int>(), bSet = Set<Int>()

    let _ = readLine()!.split(separator: " ").map { aSet.insert(Int($0)!) }
    let _ = readLine()!.split(separator: " ").map { bSet.insert(Int($0)!) }

    let result = aSet.symmetricDifference(bSet)
    print(result.count)
}
