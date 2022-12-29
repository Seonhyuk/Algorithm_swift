func solution_14425() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    var result = 0

    var set = Set<String>()

    for _ in 0..<info[0] {
        let word = readLine()!
        set.insert(word)
    }

    for _ in 0..<info[1] {
        let word = readLine()!
        if set.contains(word) {
            result += 1
        }
    }

    print(result)
}
