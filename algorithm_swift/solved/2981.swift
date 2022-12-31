func solution_2981() {
    let n = Int(readLine()!)!
    var nums: [Int] = []

    for _ in 0..<n {
        nums.append(Int(readLine()!)!)
    }

    nums.sort()

    var gcd = 0

    if n >= 3 {
        gcd = calcGcd(nums[1]-nums[0], nums[2]-nums[1])
        
        for i in 3..<n {
            gcd = calcGcd(nums[i] - nums[i-1], gcd)
        }
    } else {
        gcd = nums[1] - nums[0]
    }

    var answer = Set<Int>()
    var d = 1
    
    while gcd >= d * d {
        if gcd % d == 0 {
            answer.insert(d)
            answer.insert(gcd / d)
        }
        d += 1
    }

    for num in answer.sorted() {
        print(num, terminator: " ")
    }
    print()
}
