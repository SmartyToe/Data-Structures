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
    
    // tree root node
    private var root:Node<T>?
    
    
    // insertation of new node
    // time complexity in worst case O(n) and in general case O(h)
    
    private func insert(_ root:Node<T>, _ node:Node<T>)
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
        
        // check if subtree has root node
        // else else assign node to root
        if let root = root{
            insert(root, node)
        }else{
            root = node
        }
    }
    
    func printTree(_ order:BinarySearchTree.printOrder)
    {
        printTree(order, root: root)
    }
    
    
    private func printTree(_ order:BinarySearchTree.printOrder, root:Node<T>?)
    {
        guard let node = root else { return }

        switch order {
        case .inOrder:
            self.printTree(order, root: node.leftNode)
            print(node.value)
            self.printTree(order, root: node.rightNode)
            
        case .preOrder:
            print(node.value)
            self.printTree(order, root: node.leftNode)
            self.printTree(order, root: node.rightNode)
            
        case .postOrder:
            self.printTree(order, root: node.leftNode)
            self.printTree(order, root: node.rightNode)
            print(node.value)
        }
    }
}


extension BinarySearchTree
{
    
    func search(value:T){
        search(root, value: value)
    }
    
    private func search(_ root:Node<T>?, value:T){
       
        guard let root = root else {
            print("Couldnt find Node with value of: \(value)")
            return
        }
        
        if value > root.value {
            // search right subtree
            self.search(root.rightNode, value: value)
        }else if value < root.value {
            // search left subtree
            self.search(root.leftNode, value: value)
        }else{
            print("find value \(value)")
        }
    }
    
}
