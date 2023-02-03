func solution_11723() {
    let file = FileIO()

    var set = 0
    var res = ""

    for _ in 0..<file.readInt() {
        let c = file.readString()
        
        switch c {
        case 297:
            let num = file.readInt()
            set |= 1 << num
        case 654:
            let num = file.readInt()
            set &= ~(1 << num)
        case 510:
            let num = file.readInt()
            res.append(set & (1 << num) != 0 ? "1\n" : "0\n")
        case 642:
            let num = file.readInt()
            set ^= 1 << num
        case 313:
            set |= ~0
        case 559:
            set = 0
        default:
            break
        }
    }
}
