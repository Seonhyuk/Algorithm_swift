import Foundation

func solution_1193() -> Void {
    let n = Int(readLine()!)!

    let key = Int(ceil((-1 + sqrt(Double(1 + 8*n))) / 2))
    let sum = Int(((key-1) * (key-1) + (key-1)) / 2)
    let remainder = n - sum

    if key % 2 == 0 {
        print("\(remainder)/\(key-remainder+1)")
    }
    else {
        print("\(key-remainder+1)/\(remainder)")
    }
}
