func solution_10815() {
    let _ = Int(readLine()!)!
    var set = Set<Int>()
    let _ = readLine()!.split(separator: " ").map { set.insert(Int($0)!) }

    let _ = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }

    for num in arr {
        if set.contains(num) {
            print(1, terminator: " ")
        } else {
            print(0, terminator: " ")
        }
    }
    print()
}
