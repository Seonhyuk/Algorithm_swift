func solution_2014() {
    let kn = readLine()!.split(separator: " ").map { Int($0)! }
    let k = kn[0], n = kn[1]
    var primes = readLine()!.split(separator: " ").map { Int($0)! }
    primes.sort()
    let MAX = Int(Int32.max)

    let maxHeap = Heap<Int>()
    let q = Deque<(Int, Int)>()

    q.pushBack(element: (1, 0))

    while let now = q.popLeft() {
        for i in now.1..<k {
            let num = now.0 * primes[i]
            
            if num > MAX {
                continue
            }
            
            if maxHeap.count < n {
                maxHeap.heappush(value: -num)
                q.pushBack(element: (num, i))
            } else if num < -maxHeap.top! {
                let _ = maxHeap.heappop()
                maxHeap.heappush(value: -num)
                q.pushBack(element: (num, i))
            }
        }
    }

    if let num = maxHeap.heappop() {
        print(-num)
    }
}
