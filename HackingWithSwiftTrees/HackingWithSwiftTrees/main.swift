//
//  main.swift
//  HackingWithSwiftTrees
//
//  Created by Warren Hansen on 1/6/21.
//



struct Node<Value> {
    var value: Value
    private(set) var children: [Node] // read externally but written only internally.
    
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count }
    }
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    mutating func add(child: Node) {
        children.append(child)
    }
}

extension Node: Equatable where Value: Equatable {}
extension Node: Hashable where Value: Hashable {}
extension Node: Codable where Value: Codable {}

extension Node where Value: Equatable {
    func find(_ value: Value) -> Node? {
        if self.value == value {
            return self
        }
        
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
        
        return nil
    }
}

@_functionBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}

var andrew = Node("Andrew")
let john = Node("John")
andrew.add(child: john)

var paul = Node("Paul")
let sophie = Node("Sophie")
let charlotte = Node("Charolette")
paul.add(child: sophie)
paul.add(child: charlotte)

var root = Node("Terry")
root.add(child: andrew)
root.add(child: paul)

print(root == andrew)
print(paul != andrew)
print(paul == paul)
print(root.count)

if let paul = root.find("Paul") {
    print(paul.count)
}

let terry = Node("Terry") {
    Node("Paul") {
        Node("Sophie")
        Node("Lottie")
    }
    
    Node("Andrew") {
        Node("John")
    }
}

print(terry.count)
