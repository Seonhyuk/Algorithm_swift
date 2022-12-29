func solution_11478() {
    let word = readLine()!

    var set = Set<String.SubSequence>()

    var start = word.startIndex
    var end = word.startIndex

    while start < word.endIndex {
        while end < word.endIndex {
            set.insert(word[start...end])
            end = word.index(after: end)
        }
        
        start = word.index(after: start)
        end = start
    }

    print(set.count)
}
