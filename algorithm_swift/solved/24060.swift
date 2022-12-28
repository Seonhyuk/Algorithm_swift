func merge24060(arr: inout [Int], left: Int, mid: Int, right: Int, cnt: inout Int, check: inout Int) {
    var i = left, j = mid + 1, t = 0
    var tmp = Array(repeating: 0, count: right - left + 1)
    
    while i <= mid && j <= right {
        if arr[i] <= arr[j] {
            tmp[t] = arr[i]
            t += 1
            i += 1
        } else {
            tmp[t] = arr[j]
            t += 1
            j += 1
        }
    }
    
    while i <= mid {
        tmp[t] = arr[i]
        t += 1
        i += 1
    }
    
    while j <= right {
        tmp[t] = arr[j]
        t += 1
        j += 1
    }
    
    i = left
    t = 0
    
    while i <= right {
        arr[i] = tmp[t]
        cnt += 1
        
        if cnt == check {
            print(arr[i])
        }
        
        i += 1
        t += 1
    }
}

func mergeSort24060(arr: inout [Int], left: Int, right: Int, cnt: inout Int, check: inout Int) {
    if left < right {
        let mid = (left + right) / 2
        mergeSort24060(arr: &arr, left: left, right: mid, cnt: &cnt, check: &check)
        mergeSort24060(arr: &arr, left: mid+1, right: right, cnt: &cnt, check: &check)
        merge24060(arr: &arr, left: left, mid: mid, right: right, cnt: &cnt, check: &check)
    }
}


func solution_24060() {
    var info = readLine()!.split(separator: " ").map { Int($0)! }
    var arr = readLine()!.split(separator: " ").map { Int($0)! }

    var cnt = 0

    mergeSort24060(arr: &arr, left: 0, right: arr.endIndex-1, cnt: &cnt, check: &info[1])

    if cnt < info[1] {
        print(-1)
    }
}
