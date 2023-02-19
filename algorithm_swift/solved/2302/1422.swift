func solution_1422() {
    let file = FileIO()
    let k = file.readInt(), n = file.readInt()
    var nums: [[UInt8]] = []
    var needs: [[UInt8]] = []

    for _ in 0..<k { nums.append(file.readStringArr()) }

    nums.sort { first, second in
        if first.count != second.count {
            return first.count < second.count
        } else {
            for i in 0..<first.count {
                if first[i] != second[i] {
                    return first[i] < second[i]
                }
            }
        }
        return true
    }

    var i = k - 1
    while needs.count != n {
        if i < 0 {
            needs.append(nums[k - 1])
        } else {
            needs.append(nums[i])
            i -= 1
        }
    }

    needs.sort { first, second in
        if first.count == second.count {
            for i in 0..<first.count {
                if first[i] != second[i] {
                    return first[i] < second[i]
                }
            }
            return true
        } else {
            var left = first
            var right = second
            
            for i in 0..<second.count { left.append(second[i]) }
            for i in 0..<first.count { right.append(first[i]) }
            
            for i in 0..<left.count {
                if left[i] != right[i] {
                    return left[i] < right[i]
                }
            }
            return true
        }
    }

    var res = ""

    for i in stride(from: needs.count - 1, through: 0, by: -1) {
        for num in needs[i] {
            res += String(UnicodeScalar(num))
        }
    }

    print(res)
}
