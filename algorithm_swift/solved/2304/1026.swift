import Foundation

func solution_1026() {
    let n = Int(readLine()!)!
    var a = readLine()!.split(separator: " ").map { Int($0)! }
    var b = readLine()!.split(separator: " ").map { Int($0)! }
    
    a.sort()
    b = b.sorted(by: >)
    
    var answer = 0
    
    for i in 0..<n {
        answer += a[i] * b[i]
    }
    
    print(answer)
}
