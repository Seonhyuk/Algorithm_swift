//
//  deque.swift
//  algorithm_swift
//
//  Created by 안선혁 on 2023/01/05.
//

import Foundation

class Deque<T> {
    private var deque: [Int: T] = [:]
    private var front = 0
    private var back = 0
    
    public func pushFront(element: T) {
        self.deque[self.front] = element
        self.front -= 1
    }
    
    public func pushBack(element: T) {
        self.back += 1
        self.deque[self.back] = element
    }
    
    public func pop() -> T? {
        if self.isEmpty {
            return nil
        } else {
            let returnValue = self.deque[self.back]
            self.deque.removeValue(forKey: self.back)
            self.back -= 1
            
            return returnValue
        }
    }
    
    public func popLeft() -> T? {
        if self.isEmpty {
            return nil
        } else {
            self.front += 1
            let returnValue = self.deque[self.front]
            self.deque.removeValue(forKey: self.front)
            
            return returnValue
        }
    }
    
    public var isEmpty: Bool {
        return self.front == self.back
    }
    
    public var count: Int {
        return self.back - self.front
    }
    
    public var head: T? {
        if self.isEmpty {
            return nil
        }
        
        return self.deque[self.front + 1]
    }
    
    public var tail: T? {
        if self.isEmpty {
            return nil
        }
        
        return self.deque[self.back]
    }
}

