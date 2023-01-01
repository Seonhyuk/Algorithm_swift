func solution_25305() -> Void {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    var scores = readLine()!.split(separator: " ").map { Int($0)! }

    scores.sort()

    print(scores[info[0] - info[1]])
}
