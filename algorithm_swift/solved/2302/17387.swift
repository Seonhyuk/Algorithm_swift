func solution_17387() {
    let first = readLine()!.split(separator: " ").map { Double($0)! }
    let second = readLine()!.split(separator: " ").map { Double($0)! }

    var p1 = (first[0], first[1]), p2 = (first[2], first[3])
    var p3 = (second[0], second[1]), p4 = (second[2], second[3])

    if p1 > p2 {
        swap(&p1, &p2)
    }

    if p3 > p4 {
        swap(&p3, &p4)
    }

    let c123 = ccw(p1, p2, p3)
    let c124 = ccw(p1, p2, p4)
    let c341 = ccw(p3, p4, p1)
    let c342 = ccw(p3, p4, p2)

    let c1 = c123 * c124
    let c2 = c341 * c342

    if c1 == 0 && c2 == 0 {
        if (p1 <= p4 && p2 >= p3) {
            print(1)
        } else {
            print(0)
        }
    } else {
        if c1 <= 0 && c2 <= 0 {
            print(1)
        } else {
            print(0)
        }
    }
}
