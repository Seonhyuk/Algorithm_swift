import Foundation

func backtracking_2580(
    idx: Int,
    check: [(y: Int, x: Int)],
    sudoku: inout [[Int]]
) {
    if idx == check.count {
        for i in 0..<9 {
            for j in 0..<9 {
                print(sudoku[i][j], terminator: " ")
            }
            print()
        }
        exit(0)
    }
    
    let y = check[idx].y, x = check[idx].x

    for num in 1...9 {
        if xCheck(num: num, x: y, sudoku: sudoku) && yCheck(num: num, y: x, sudoku: sudoku) && sCheck(num: num, x: y, y: x, sudoku: sudoku) {
            sudoku[y][x] = num
            backtracking_2580(idx: idx+1, check: check, sudoku: &sudoku)
            sudoku[y][x] = 0
        }
    }
}

func xCheck(num: Int, x: Int, sudoku: [[Int]]) -> Bool {
    for i in 0..<9 {
        if sudoku[x][i] == num {
            return false
        }
    }
    return true
}

func yCheck(num: Int, y: Int, sudoku: [[Int]]) -> Bool {
    for i in 0..<9 {
        if sudoku[i][y] == num {
            return false
        }
    }
    return true
}

func sCheck(num: Int, x: Int, y: Int, sudoku: [[Int]]) -> Bool {
    let a = x - x % 3, b = y - y % 3
    
    for i in 0..<3 {
        for j in 0..<3 {
            if sudoku[a+i][b+j] == num {
                return false
            }
        }
    }
    return true
}

func checkPossible(sudoku: [[Int]], check: inout [(y: Int, x: Int)]) {
    for i in 0..<9 {
        for j in 0..<9 {
            if sudoku[i][j] == 0 {
                check.append((i, j))
            }
        }
    }
}

func solution_2580() {
    var sudoku: [[Int]] = []
    for _ in 0..<9 {
        sudoku.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    var check: [(y: Int, x: Int)] = []
    checkPossible(sudoku: sudoku, check: &check)
    
    backtracking_2580(idx: 0, check: check, sudoku: &sudoku)
}
