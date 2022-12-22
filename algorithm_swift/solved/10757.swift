import Foundation

func solution_10757() -> Void {
    let nums = readLine()!.split(separator: " ").map { String($0) }
    let num1 = nums[0], num2 = nums[1]

    let long_num = num1.count >= num2.count ? num1.map { $0 } : num2.map { $0 }
    var short_num = num1.count < num2.count ? num1.map { $0 } : num2.map { $0 }
    var answer = [String](repeating: "0", count: long_num.count)

    for _ in 0..<(long_num.count-short_num.count) {
        short_num.insert("0", at: 0)
    }

    var remainder = 0

    for i in stride(from: answer.count-1, to: -1, by: -1) {
        var sum = Int(String(long_num[i]))! + Int(String(short_num[i]))! + remainder
        
        if sum > 9 {
            sum -= 10
            remainder = 1
            answer[i] = String(sum)
        }
        else {
            remainder = 0
            answer[i] = String(sum)
        }
    }

    print(remainder == 1 ? "1" + answer.joined(separator: "") : answer.joined(separator: ""))
}
