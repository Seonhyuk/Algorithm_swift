import Foundation

func solution_1069() {
    let xydt = readLine()!.split(separator: " ").map { Double($0)! }
    let x = xydt[0], y = xydt[1], d = xydt[2], t = xydt[3]
    let dist = sqrt(x*x + y*y)

    if d <= t {
        print(dist)
    } else {
        var ans: Double = 0
        
        if dist >= d {
            ans = min(t * Double(Int(dist / d)) + dist.truncatingRemainder(dividingBy: d), t * Double(Int(dist / d) + 1))
        } else {
            ans = min(t + d - dist, 2 * t, dist)
        }
        
        print(ans)
    }
}


/**
 직선 거리가 점프 거리보다 크다면
 1. 점프 뛸 거 다 뛰고 걸어가거나
 2. 점프를 한 번 더 뛰는 걸로
 
 직선 거리가 점프 거리보다 작다면
 1. 다 걸어가거나
 2. 두 번 점프하거나
 3. 점프 뛰고 걸어가거나
 */
