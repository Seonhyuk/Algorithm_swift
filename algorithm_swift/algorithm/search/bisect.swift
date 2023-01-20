func bisectLeft(arr: [Int], value: Int, asc: Bool = true) -> Int {
    var left = 0, right = arr.count - 1
    
    if !asc {
        while left <= right {
            let mid = (left + right) / 2
            
            if arr[mid] <= value {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    } else {
        while left <= right {
            let mid = (left + right) / 2
            
            if arr[mid] < value {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    
    return left
}

func bisectRight(arr: [Int], value: Int, asc: Bool = true) -> Int {
    var left = 0, right = arr.count - 1
    
    if !asc {
        while left <= right {
            let mid = (left + right) / 2
            
            if arr[mid] <= value {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    } else {
        while left <= right {
            let mid = (left + right) / 2
            
            if arr[mid] > value {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
    
    return right
}
