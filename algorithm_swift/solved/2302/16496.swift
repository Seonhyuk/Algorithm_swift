import Foundation

func solution_16496() {
    let file = FileIO()
    let n = file.readInt()
    var nums: [[UInt8]] = []

    for _ in 0..<n { nums.append(file.readStringArr()) }

    nums.sort { first, second in
        let length = first.count + second.count
        var left: [UInt8] = Array(repeating: 0, count: length)
        var right: [UInt8] = Array(repeating: 0, count: length)
        
        for i in 0..<first.count {
            left[i] = first[i]
            right[i + second.count] = first[i]
        }
        
        for i in 0..<second.count {
            left[i + first.count] = second[i]
            right[i] = second[i]
        }
        
        for i in 0..<length {
            if left[i] != right[i] {
                return left[i] > right[i]
            }
        }
        
        return true
    }

    var result = ""

    for num in nums {
        for alpha in num {
            result += String(UnicodeScalar(alpha))
        }
    }

    var isZero = true

    for r in result {
        if r != "0" { isZero = false }
    }

    if isZero {
        print(0)
    } else {
        print(result)
    }
}
