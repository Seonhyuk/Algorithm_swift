import Foundation

func bubbleSort(arr: inout [Int]) {
    let cnt = arr.count
    
    for i in 0..<(cnt-1) {
        for j in 0..<(cnt-i-1) {
            if arr[j] > arr[j+1] {
                let flag = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = flag
            }
        }
    }
}
