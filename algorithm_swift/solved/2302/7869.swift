import Foundation

func solution_7869() {
    let info = readLine()!.split(separator: " ").map { Double($0)! }

    var ans: Double = 0

    let x1 = info[0], y1 = info[1], r1 = info[2]
    let x2 = info[3], y2 = info[4], r2 = info[5]

    let d = sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1))

    if abs(r1 - r2) >= d {
        let minR = min(r1, r2)
        ans = minR * minR * Double.pi
    } else if r1 + r2 > d {
        let theta1 = acos((d * d + r1 * r1 - r2 * r2) / (2 * d * r1))
        let theta2 = acos((d * d + r2 * r2 - r1 * r1) / (2 * d * r2))
        
        let s1 = theta1 * r1 * r1 - sin(theta1 * 2) * r1 * r1 / 2
        let s2 = theta2 * r2 * r2 - sin(theta2 * 2) * r2 * r2 / 2
        
        ans = s1 + s2
    }

    print(String(format: "%.3f", ans))
}
