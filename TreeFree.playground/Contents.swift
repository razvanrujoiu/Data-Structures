import Foundation

class Node {
    var value: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
    
}

let devices = Node(value: "Devices")
let appleDevices = Node(value: "Apple")
let androidDevices = Node(value: "Android")

devices.add(child: appleDevices)
devices.add(child: androidDevices)


let iPhone = Node(value: "iPhone")
let macBook = Node(value: "MacBook")

appleDevices.add(child: iPhone)
appleDevices.add(child: macBook)

let iPhone8 = Node(value: "iPhone8")

iPhone.add(child: iPhone8)

androidDevices.add(child: Node(value: "Galaxy"))
androidDevices.add(child: Node(value: "Huawei"))

print(devices)


extension Node: CustomStringConvertible {
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " { " + children.map { $0.description }.joined(separator: ", ") + " } "
        }
        return text
    }
}

extension Node {
    func search(value: String) -> Node? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

let searchResult = devices.search(value: "iPhone")



