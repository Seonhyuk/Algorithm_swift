func solution_20149() {
    func getPoint(_ p1: (Double, Double), _ p2: (Double, Double), _ p3: (Double, Double), _ p4: (Double, Double)) -> (Double, Double) {
        let slope1 = (p2.1 - p1.1) / (p2.0 - p1.0)
        let slope2 = (p4.1 - p3.1) / (p4.0 - p3.0)
            
        let k1 = p1.1 - slope1 * p1.0
        let k2 = p3.1 - slope2 * p3.0
            
        if slope1 == Double.infinity {
            return (p1.0, slope2 * p1.0 + k2)
        } else if slope2 == Double.infinity {
            return (p3.0, slope1 * p3.0 + k1)
        }
        
        let X = (k2 - k1) / (slope1 - slope2)
        let Y = slope1 * X + k1
        
        return (X, Y)
    }


    let first = readLine()!.split(separator: " ").map { Double($0)! }
    let second = readLine()!.split(separator: " ").map { Double($0)! }

    var p1 = (first[0], first[1]), p2 = (first[2], first[3])
    var p3 = (second[0], second[1]), p4 = (second[2], second[3])

    if p1 > p2 {
        swap(&p1, &p2)
    }

    if p3 > p4 {
        swap(&p3, &p4)
    }

    let c123 = ccw(p1, p2, p3)
    let c124 = ccw(p1, p2, p4)
    let c341 = ccw(p3, p4, p1)
    let c342 = ccw(p3, p4, p2)

    let c1 = c123 * c124
    let c2 = c341 * c342

    if c1 == 0 && c2 == 0 {
        let isHorizontal = c123 == 0 && c124 == 0 && c341 == 0 && c342 == 0
        
        if !isHorizontal && p1 <= p4 && p2 >= p3 {
            print(1)
            if p1 == p3 || p1 == p4 {
                print(p1.0, p1.1)
            } else if p2 == p3 || p2 == p4 {
                print(p2.0, p2.1)
            }
        } else if p1 <= p4 && p2 >= p3 {
            print(1)
            if p1 == p4 {
                print(p1.0, p1.1)
            } else if p2 == p3 {
                print(p2.0, p2.1)
            }
        } else {
            print(0)
        }
    } else {
        if c1 <= 0 && c2 <= 0 {
            print(1)
        
            let point = getPoint(p1, p2, p3, p4)
            print(point.0, point.1)
        } else {
            print(0)
        }
    }
}
