//: [Previous](@previous)

import Foundation

//Node-Class
class Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.value! < rhs.value!
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value! == rhs.value!
    }
    
    static func > (lhs: Node, rhs: Node) -> Bool {
        return lhs.value! > rhs.value!
    }
    
    var value: Int?
    var leftNode: Node?
    var rightNode: Node?
    
    var isLeaf: Bool {
        return leftNode == nil && rightNode == nil
    }
    
    init(value: Int, leftNode: Node?, rightNode: Node?) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    
    init(value: Int){
        self.value = value
    }
    
}

class BinaryTree {
    var rootNode: Node?
    lazy var currentNode = rootNode!
    
    //Takes a node and inserts it to the right place. Algorithm shown in the flowChart in the foulder 'Resources'
    func addNode(_ node: Node){
        
        if node == currentNode { return }
        
        if node < currentNode {
            if currentNode.leftNode != nil {
                currentNode = currentNode.leftNode!
                //recursive function call
                addNode(node)
            }else{
                currentNode.leftNode = node
                print("Added Node \(node.value!) on the left of Node \(currentNode.value!)")
                currentNode = rootNode!
            }
        }else{
            if currentNode.rightNode != nil{
                currentNode = currentNode.rightNode!
                //recursive function call
                addNode(node)
            }else{
                currentNode.rightNode = node
                print("Added Node \(node.value!) on the right of Node \(currentNode.value!)")
                currentNode = rootNode!
            }
        }
    }
    
    init(rootNode: Node) {
        self.rootNode = rootNode
    }
}

//creating and filling the tree
var binaryTree = BinaryTree(rootNode: Node(value: 10))
binaryTree.addNode(Node(value: 7))
binaryTree.addNode(Node(value: 5))
binaryTree.addNode(Node(value: 8))
binaryTree.addNode(Node(value: 9))
binaryTree.addNode(Node(value: 12))
binaryTree.addNode(Node(value: -1))
binaryTree.addNode(Node(value: 8))
binaryTree.addNode(Node(value: 10))
binaryTree.addNode(Node(value: 22))
binaryTree.addNode(Node(value: 11))


//Function that searches a node in a recursive manner
func binarySearchTree(at node: Node?, for searchedNode: Node) -> Bool {
    
    if node == nil { return false }
    
    if node == searchedNode {
        return true
    } else if searchedNode < node!{
        return binarySearchTree(at: node?.leftNode, for: searchedNode)
    }else{
        return binarySearchTree(at: node?.rightNode, for: searchedNode)
    }
}

binarySearchTree(at: binaryTree.rootNode, for: Node(value: 22))
binarySearchTree(at: binaryTree.rootNode, for: Node(value: 100))




//: [Next](@next)
