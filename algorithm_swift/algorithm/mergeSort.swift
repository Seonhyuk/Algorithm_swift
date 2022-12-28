func merge(arr: inout [Int], left: Int, mid: Int, right: Int) {
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
        i += 1
        t += 1
    }
}

func mergeSort(arr: inout [Int], left: Int, right: Int) {
    if left < right {
        let mid = (left + right) / 2
        mergeSort(arr: &arr, left: left, right: mid)
        mergeSort(arr: &arr, left: mid+1, right: right)
        merge(arr: &arr, left: left, mid: mid, right: right)
    }
}


