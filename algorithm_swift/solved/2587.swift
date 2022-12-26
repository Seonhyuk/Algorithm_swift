func solution_2587() -> Void {
    var values = Array(repeating: 0, count: 5)
    var total = 0

    for i in 0..<5 {
        let value = Int(readLine()!)!
        values[i] = value
        total += value
    }

    values.sort()

    print(total / 5)
    print(values[2])
}
