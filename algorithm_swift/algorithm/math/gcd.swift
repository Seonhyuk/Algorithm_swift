func calcGcd(_ num1: Int, _ num2: Int) -> Int {
    if num1 >= num2 {
        if num1 % num2 == 0 {
            return num2
        } else {
            return calcGcd(num2, num1 % num2)
        }
    } else {
        if num2 % num1 == 0 {
            return num1
        } else {
            return calcGcd(num1, num2 % num1)
        }
    }
}
