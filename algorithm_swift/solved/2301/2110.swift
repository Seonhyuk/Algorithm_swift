func solution_2110() {
    let file = FileIO()
    
    let n = file.readInt()
    let c = file.readInt()
    
    var home = Array(repeating: 0, count: n)
    
    for i in 0..<n {
        home[i] = file.readInt()
    }
    
    home.sort()
    
    var end = (home[n - 1] - home[0]) / (c - 1)
    var start = 1
    
    if c == 2 {
        print(end)
    } else {
        var mid = (start + end) / 2
        var result = 1
        
        while start < end {
            var count = 1
            var now = home[0]

            for i in 1..<n {
                if home[i] - now >= mid {
                    count += 1
                    now = home[i]
                }
            }
            
            if count >= c {
                result = mid
                start = mid + 1
            } else {
                end = mid
            }
            
            mid = (start + end) / 2
        }
        print(result)
    }
}
