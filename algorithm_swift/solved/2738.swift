import Foundation

func solution_2738() -> Void {
    
    func newLine(k: Int) -> [[Int8]] {
        var newL: [[Int8]] = []
        
        for _ in 0..<k {
            let line = readLine()!.split(separator: " ").map { Int8($0)! }
            newL.append(line)
        }
        
        return newL
    }
    
    let info = readLine()!.split(separator: " ").map { Int($0)! }

    let f = newLine(k: info[0])
    let s = newLine(k: info[0])

    for i in 0..<info[0] {
        for j in 0..<info[1] {
            print(f[i][j] + s[i][j], terminator: " ")
        }
        print()
    }
}
