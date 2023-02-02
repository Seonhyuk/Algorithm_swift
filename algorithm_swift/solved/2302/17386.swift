import Foundation

func solution_17386() {
    let first = readLine()!.split(separator: " ").map { Double($0)! }
    let second = readLine()!.split(separator: " ").map { Double($0)! }

    let x1 = first[0], y1 = first[1], x2 = first[2], y2 = first[3]
    let x3 = second[0], y3 = second[1], x4 = second[2], y4 = second[3]

    let c1 = ccw((x1, y1), (x2, y2), (x3, y3)) * ccw((x1, y1), (x2, y2), (x4, y4))
    let c2 = ccw((x3, y3), (x4, y4), (x1, y1)) * ccw((x3, y3), (x4, y4), (x2, y2))

    if c1 > 0 {
        print(0)
    } else if c2 > 0 {
        print(0)
    } else {
        print(1)
    }
}
