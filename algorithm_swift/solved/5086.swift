func solution_5086() {
    while true {
        let values = readLine()!.split(separator: " ").map { Int($0)! }
        
        if values[0] == 0 && values[1] == 0 {
            break
        }
        
        if values[0] > values[1] && values[0] % values[1] == 0 {
            print("multiple")
        } else if values[1] > values[0] && values[1] % values[0] == 0 {
            print("factor")
        } else {
            print("neither")
        }
    }
}
