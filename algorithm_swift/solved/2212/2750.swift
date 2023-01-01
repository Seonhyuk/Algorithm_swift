func solution_2750() -> Void {
    let n = Int(readLine()!)!
    var arr = Array(repeating: 0, count: n)

    for i in 0..<n {
        let k = Int(readLine()!)!
        arr[i] = k
    }

    bubbleSort(arr: &arr)

    for i in 0..<n {
        print(arr[i])
    }
}
