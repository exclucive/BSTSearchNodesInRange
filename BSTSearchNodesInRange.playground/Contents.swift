//: Playground - noun: a place where people can play

import UIKit

class BSTree {
    let value: Int
    var left: BSTree?
    var right: BSTree?
    
    init(value: Int) {
        self.value = value
    }
}

func numberOfNodes(node: BSTree?, low: Int, high: Int) -> Int {
    guard let node = node else {
        return 0
    }
    
    if node.value == low && node.value == high {
        return 1
    }

    if node.value >= low && node.value <= high {
        return 1 + numberOfNodes(node: node.left, low: low, high: high) +
            numberOfNodes(node: node.right, low: low, high: high)
    }
    
    if node.value < low {
        return numberOfNodes(node: node.right, low: low, high: high)
    }
    else {
        return numberOfNodes(node: node.left, low: low, high: high)
    }
}

let ten = BSTree(value: 10)
let five = BSTree(value: 5)
let one = BSTree(value: 1)
let fifteen = BSTree(value: 15)
let twenty = BSTree(value: 20)
let fifty = BSTree(value: 50)

ten.left = five
five.left = one

ten.right = twenty
twenty.left = fifteen
twenty.right = fifty

numberOfNodes(node: ten, low: 5, high: 20)
