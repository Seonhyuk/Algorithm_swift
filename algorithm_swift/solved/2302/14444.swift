import Foundation

// FileIO.readStringArr 에서 사이에 문자 추가하는 거 수정해야 돌아감!
func solution_14444() {
    let file = FileIO()
    let str = file.readStringArr()
    
    let n = str.count
    var r = 0, k = 0
    var palindrome = Array(repeating: 0, count: n)
    var ans = 0
    
    for i in 0..<n {
        if i <= r {
            palindrome[i] = min(palindrome[2 * k - i], r - i)
        }
        
        while i - palindrome[i] - 1 >= 0 && i + palindrome[i] + 1 < n && str[i - palindrome[i] - 1] == str[i + palindrome[i] + 1] {
            palindrome[i] += 1
        }
        
        if r < i + palindrome[i] {
            r = i + palindrome[i]
            k = i
        }
        
        if palindrome[i] > ans {
            ans = palindrome[i]
        }
    }
    
    print(ans)
}
