//
//  Queue.swift
//  Coordinator Template
//
//  Created by Amir lahav on 06/02/2019.
//  Copyright © 2019 Amir lahav. All rights reserved.
//

public struct Queue<T:Equatable> {
    
    fileprivate var array = [T]()
    
    public var size: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
    }
    
    public func indexes(_ element: T) -> [Int]{
        return array.indexes(of: element)
    }
}
