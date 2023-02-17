func solution_1057() {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let n = line[0]
    var a = line[1], b = line[2]
    var cnt = 0

    while a != b {
        a -= a / 2
        b -= b / 2
        cnt += 1
    }

    print(cnt)
}
