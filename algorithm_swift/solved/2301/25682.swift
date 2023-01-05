import Foundation

func solution_25682() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let n = info[0], m = info[1], k = info[2]
    
    var sameArr: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var diffArr: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
    var matrix: [[Character]] = []
    for _ in 0..<n {
        let line = readLine()!.map { $0 }
        matrix.append(line)
    }
    
    for i in 0..<n {
        var cntW = 0, cntB = 0
        
        for j in 0..<m {
            if (i % 2 == 1 && j % 2 == 1) || (i % 2 == 0 && j % 2 == 0) {
                if matrix[i][j] == "W" {
                    cntW += 1
                }
            } else {
                if matrix[i][j] == "B" {
                    cntB += 1
                }
            }
            sameArr[i+1][j+1] = cntW
            diffArr[i+1][j+1] = cntB
        }
    }
    
    for i in 1...m {
        for j in 1...n {
            sameArr[j][i] = sameArr[j-1][i] + sameArr[j][i]
            diffArr[j][i] = diffArr[j-1][i] + diffArr[j][i]
        }
    }
    
    var result = 4000000
    
    for i in k...n {
        for j in k...m {
            let sameCnt = sameArr[i][j] + sameArr[i-k][j-k] - sameArr[i-k][j] - sameArr[i][j-k]
            let diffCnt = diffArr[i][j] + diffArr[i-k][j-k] - diffArr[i-k][j] - diffArr[i][j-k]
            
            let whiteFirst = k * k - (sameCnt + diffCnt)
            let blackFirst = sameCnt + diffCnt

            if whiteFirst < result {
                result = whiteFirst
            }
            if blackFirst < result {
                result = blackFirst
            }
        }
    }
    
    print(result)
}
