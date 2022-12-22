import Foundation

extension String {
    func slicing(_ start: Int, _ end: Int) -> String {
        guard start < count, end >= 0, end - start >= 0 else {
            return ""
        }

        let startIdx = index(self.startIndex, offsetBy: max(0, start))
        let endIdx = index(self.startIndex, offsetBy: end)

        return String(self[startIdx..<endIdx])
    }
}
