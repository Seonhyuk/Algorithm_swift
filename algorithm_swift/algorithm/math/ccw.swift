import Foundation

func ccw<T: Numeric>(_ p1: (T, T), _ p2: (T, T), _ p3: (T, T)) -> T {
    let first = p1.0 * (p2.1 - p3.1)
    let second = p2.0 * (p3.1 - p1.1)
    let third = p3.0 * (p1.1 - p2.1)
    
    return first + second + third
}
