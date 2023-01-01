func divide_2004(divisor: Int, main: Int) -> Int {
    var result = 0
    
    var i = divisor
    while i <= main {
        result += main / i
        i *= divisor
    }
    
    return result
}

func solution_2004() {
    var info = readLine()!.split(separator: " ").map { Int($0)! }
    info.append(info[0] - info[1])
    
    var result = [0, 0, 0, 0, 0, 0]
    
    for i in 0..<3 {
        result[i] += divide_2004(divisor: 2, main: info[i])
        result[i+3] += divide_2004(divisor: 5, main: info[i])
    }
    
    print(min(result[0] - result[1] - result[2], result[3] - result[4] - result[5]))
}
