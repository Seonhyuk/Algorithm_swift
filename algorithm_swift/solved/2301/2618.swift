func solution_2618() {
    let n = Int(readLine()!)!
    let w = Int(readLine()!)!
    let INF = 1_000_000_000
    
    var car1 = Array(repeating: Array(repeating: (weight: INF, fc: 0), count: w), count: w)
    var car2 = Array(repeating: Array(repeating: (weight: INF, fc: 0), count: w), count: w)
    
    var ws = Array(repeating: 0, count: w)
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0] - 1, b = ab[1] - 1
    ws[0] = a * 10000 + b
    
    car1[0][0].weight = a + b
    car2[0][0].weight = 2 * n - 2 - a - b
    
    for i in 1..<w {
        let yx = readLine()!.split(separator: " ").map { Int($0)! }
        let y = yx[0] - 1, x = yx[1] - 1
        ws[i] = y * 10000 + x
        let iwy = ws[i-1] / 10000, iwx = ws[i-1] % 10000
        
        for j in 0..<i {
            var jwy = 0, jwx = 0
            if j > 0 {
                jwy = ws[j-1] / 10000
                jwx = ws[j-1] % 10000
            }
            
            car1[j][i].weight = car1[j][i-1].weight + abs(iwy - y) + abs(iwx - x)
            car1[j][i].fc = 10000 + j
            
            car2[j][i].weight = car2[j][i-1].weight + abs(iwy - y) + abs(iwx - x)
            car2[j][i].fc = 20000 + j
            
            if j > 0 {
                if car1[i][i].weight > car2[j][i-1].weight + abs(jwy - y) + abs(jwx - x) {
                    car1[i][i].weight = car2[j][i-1].weight + abs(jwy - y) + abs(jwx - x)
                    car1[i][i].fc = 20000 + j
                }
                
                if car2[i][i].weight > car1[j][i-1].weight + abs(jwy - y) + abs(jwx - x) {
                    car2[i][i].weight = car1[j][i-1].weight + abs(jwy - y) + abs(jwx - x)
                    car2[i][i].fc = 10000 + j
                }
            } else {
                car1[i][i].weight = car2[j][i-1].weight + y + x
                car1[i][i].fc = 20000
                
                car2[i][i].weight = car1[j][i-1].weight + 2 * n - 2 - y - x
                car2[i][i].fc = 10000
            }
        }
    }
    
    var ans = INF
    var car = 1
    var order = Array(repeating: 0, count: w)
    var idx = 0
    var idx2 = w-1
    
    for i in 0..<w {
        if ans > car1[i][w-1].weight {
            ans = car1[i][w-1].weight
            car = 1
            idx = i
        }
        
        if ans > car2[i][w-1].weight {
            ans = car2[i][w-1].weight
            car = 2
            idx = i
        }
    }
    
    print(ans)
    
    while car != 0 {
        order[idx2] = car
        if car == 1 {
            car = car1[idx][idx2].fc / 10000
            idx = car1[idx][idx2].fc % 10000
            
        } else {
            car = car2[idx][idx2].fc / 10000
            idx = car2[idx][idx2].fc % 10000
        }
        idx2 -= 1
    }
    
    for o in order {
        print(o)
    }
}
