//
//  heap.swift
//  algorithm_swift
//
//  Created by 안선혁 on 2023/01/16.
//

import Foundation

final class Heap<T: Comparable> {
    private var heap: [T?] = [nil]
    private var last = 0
    
    @inline(__always) var count: Int {
        return self.last
    }
    
    @inline(__always) var top: T? {
        if last == 0 {
            return nil
        }
        
        return self.heap[1]
    }
    
    @inline(__always) func heappush(value: T) {
        self.last += 1
        self.heap.append(value)
        
        var c = self.last
        var p = c / 2
        while p >= 1 && self.heap[p]! > self.heap[c]! {
            swapValue(a: p, b: c)
            c = p
            p = c / 2
        }
    }
    
    @inline(__always) func heappop() -> T? {
        if self.isEmpty {
            return nil
        }
        
        let tmp = self.heap[1]
        self.heap[1] = self.heap[self.last]
        let _ = self.heap.popLast()
        self.last -= 1
        
        var p = 1
        var c = p * 2
        while c <= self.last {
            if c + 1 <= self.last && self.heap[c]! > self.heap[c+1]! {
                c += 1
            }
            
            if self.heap[p]! > self.heap[c]! {
                self.swapValue(a: p, b: c)
                p = c
                c = p * 2
            } else {
                break
            }
        }
        
        return tmp
    }
    
    @inline(__always) private func swapValue(a: Int, b: Int) {
        let flag = self.heap[b]
        self.heap[b] = self.heap[a]
        self.heap[a] = flag
    }
    
    @inline(__always) private var isEmpty: Bool {
        return self.last == 0
    }
}
