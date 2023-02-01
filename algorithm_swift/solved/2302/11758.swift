func solution_11758() {
    let p1 = readLine()!.split(separator: " ").map { Int($0)! }
    let p2 = readLine()!.split(separator: " ").map { Int($0)! }
    let p3 = readLine()!.split(separator: " ").map { Int($0)! }

    let ccw = (p2[0] - p1[0]) * (p3[1] - p1[1]) - (p3[0] - p1[0]) * (p2[1] - p1[1])

    if ccw > 0 { print(1) }
    else if ccw == 0 { print(0) }
    else { print(-1) }
}
