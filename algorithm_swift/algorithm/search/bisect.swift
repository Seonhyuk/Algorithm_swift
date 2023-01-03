func bisectLeft(arr: [Int], value: Int, asc: Bool = true) -> Int {
    var start = 0, end = arr.count - 1
    var idx = (start + end) / 2
    
    if asc && value > arr[end] {
        return arr.count
    } else if !asc && value < arr[end] {
        return arr.count
    }
    
    while true {
        if arr[idx] == value {
            while idx > 0 {
                if arr[idx-1] == value {
                    idx -= 1
                } else {
                    break
                }
            }
            
            return idx
        }
        else {
            if !asc {
                if arr[idx] > value {
                    start = idx + 1
                }
                else {
                    end = idx
                }
            } else {
                if arr[idx] < value {
                    start = idx + 1
                }
                else {
                    end = idx
                }
            }
        }
        
        if (start + end) / 2 == idx {
            return idx
        }
        
        idx = (start + end) / 2
    }
}
