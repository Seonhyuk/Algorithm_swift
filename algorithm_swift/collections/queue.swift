//
//  queue.swift
//  algorithm_swift
//
//  Created by 안선혁 on 2023/01/07.
//

import Foundation

class Queue<T> {
    private var queue: [T?] = []
    private var size: Int = 0
    private var front: Int = 0
    private var rear: Int = 0
    private var cnt: Int = 0
    
    init(size: Int) {
        self.queue = Array(repeating: nil, count: size)
        self.size = size
    }
    
    func isFull() -> Bool {
        return (self.rear+1) % self.size == self.front
    }
    
    func isEmpty() -> Bool {
        return self.front == self.rear
    }
    
    func pushBack(element: T) {
        if self.isFull() {
            return
        }
        self.rear = (self.rear + 1) % self.size
        self.queue[self.rear] = element
        self.cnt += 1
    }
    
    func popFront() -> T? {
        if self.isEmpty() {
            return nil
        }
        self.front = (self.front + 1) % self.size
        self.cnt -= 1
        return self.queue[self.front]
    }
    
    var head: T? {
        if self.isEmpty() {
            return nil
        }
        
        return self.queue[self.front+1]
    }
    
    var tail: T? {
        if self.isEmpty() {
            return nil
        }
        
        return self.queue[self.rear]
    }
    
    var count: Int {
        return self.cnt
    }
}
