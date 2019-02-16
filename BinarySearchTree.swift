//
//  BinarySearchTree.swift
//  Coordinator Template
//
//  Created by Amir lahav on 15/02/2019.
//  Copyright © 2019 Amir lahav. All rights reserved.
//

import Foundation

class Node<T>:NSObject
{
    var value:T
    var leftNode:Node?
    var rightNode:Node?
    
    init(_ value:T, _ leftNode:Node? = nil, _ rightNode:Node? = nil) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

class BinarySearchTree<T:Comparable & CustomStringConvertible>: NSObject {
    
    
    enum printOrder {
        case inOrder
        case preOrder
        case postOrder
    }
    
    
    private var root:Node<T>?
    
    func insert(_ root:Node<T>, _ node:Node<T>)
    {
        if root.value > node.value {
            if let left = root.leftNode {
                self.insert(left, node)
            }else{
                root.leftNode = node
            }
        }else{
            if let right = root.rightNode {
                self.insert(right, node)
            }else{
                root.rightNode = node
            }
        }
    }
    
    
    func addNode(_ value: T)
    {
        let node = Node(value)
        if let root = root{
            insert(root, node)
        }else{
            root = node
        }
    }
    
    func printTree(_ order:BinarySearchTree.printOrder, root:Node<T>?)
    {
        guard let node = root else { return }

        switch order {
        case .inOrder:
            self.printTree(.inOrder, root: node.leftNode)
            print(node.value)
            self.printTree(.inOrder, root: node.rightNode)
            
        case .preOrder:
            print(node.value)
            self.printTree(.preOrder, root: node.leftNode)
            self.printTree(.preOrder, root: node.rightNode)
            
        case .postOrder:
            self.printTree(.postOrder, root: node.leftNode)
            self.printTree(.postOrder, root: node.rightNode)
            print(node.value)
        }
    }
    
}
