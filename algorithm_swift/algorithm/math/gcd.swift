func calcGcd(_ num1: Int, _ num2: Int) -> Int {
    let a = max(num1, num2)
    let b = min(num1, num2)
    
    if a % b == 0 {
        return b
    } else {
        return calcGcd(b, a % b)
    }
}
