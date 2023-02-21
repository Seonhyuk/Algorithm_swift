import Foundation

func solution_14464() {
    let file = FileIO()
    let c = file.readInt(), n = file.readInt()
    var chicken = Array(repeating: 0, count: c)
    var cows = Array(repeating: (0, 0), count: n)

    for i in 0..<c { chicken[i] = file.readInt() }
    for i in 0..<n { cows[i] = (file.readInt(), file.readInt()) }

    var res = 0
    chicken.sort()
    cows.sort { a, b in
        if a.1 != b.1 {
            return a.1 < b.1
        } else {
            return a.0 < b.0
        }
    }

    var visited = Array(repeating: false, count: c)

    for cow in cows {
        for (idx, value) in chicken.enumerated() {
            if cow.0...cow.1 ~= value && !visited[idx] {
                res += 1
                visited[idx] = true
                break
            }
        }
    }

    print(res)
}
