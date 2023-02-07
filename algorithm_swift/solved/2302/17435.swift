import Foundation

// python3 같은 로직으로는 통과되나 swift는 안 된ㄷㅏ..
func solution_17435() {
    let file = FileIO()
    let m = file.readInt()

    var f = Array(repeating: Array(repeating: 0, count: 20), count: m + 1)

    for i in 1...m {
        f[i][0] = file.readInt()
    }

    for j in 0..<19 {
        for i in 1...m {
            f[i][j+1] = f[f[i][j]][j]
        }
    }

    var answer = ""

    for _ in 0..<file.readInt() {
        var n = file.readInt(), x = file.readInt()
        
        for j in stride(from: 19, through: 0, by: -1) {
            if n & (1 << j) != 0 {
                x = f[x][j]
            }
        }
        
        answer.write("\(x)\n")
    }

    print(answer, terminator: "")
}
