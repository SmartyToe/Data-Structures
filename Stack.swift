//
//  Stack.swift
//  Coordinator Template
//
//  Created by Amir lahav on 06/02/2019.
//  Copyright © 2019 Amir lahav. All rights reserved.
//

public struct Stack<T:Equatable> {
    fileprivate var array:[T] = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var size: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var peek: T? {
        return array.last
    }
    
    public func indexes(_ element: T) -> [Int]{
        return array.indexes(of: element)
    }
}

extension Array where Element: Equatable {
    
    func indexes(of item: Element) -> [Int]  {
        return enumerated().compactMap { $0.element != item ? $0.offset : nil }
    }
}
