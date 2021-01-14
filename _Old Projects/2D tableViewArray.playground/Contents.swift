//: Playground - noun: a place where people can play

import UIKit

var tableViewArray =  [
    ["Warren Hansen Director of Photography", "1 Camera", "1 Primes Canon Telephoto", "1 Primes Zeiss Master Primes"],
    ["Camera Order Nike 12 / 20 / 2016", "Arri Alexa", "150nn, 200mm", "Need a var to pass in"]]

var updatedKit = "18mm, 25mm"
print("1 1 \(tableViewArray[1][1])")
print("1 2 \(tableViewArray[1][2])") // this is the one I need to fix, always the 3rd element 2, but need to count first element to know which one to update
print("count is always \(tableViewArray.count) for title and detail arrays")
print("\ntableviewarray in update items\n\(tableViewArray)\n")

//for var first in 0..<tableViewArray.count {
//    var line = ""
//    print("first:\(first)")
//    for var second in 0..<tableViewArray[first].count {
//        
//        line = String(tableViewArray[first][second])
//        //line += " "
//        print("second:\(second) = \(line)\n ")
//        if first == 1 && second == tableViewArray[first].count - 1
//        {
//            print("*** last element ***   \(tableViewArray[first].last!)")
//            tableViewArray[1][second] = updatedKit
//        }
//    }
//}

/// replace the last elemet of a 2D Array to update lens lit for tableview
func replaceLastLensKit(tableViewArrayIn: [[String]])-> [[String]] {

    var newTableViewArray = tableViewArrayIn
    for first in 0..<newTableViewArray.count {
        var line = ""
        print("first:\(first)")
        for second in 0..<newTableViewArray[first].count {
            
            line = String(newTableViewArray[first][second])
            print("second:\(second) = \(line)\n ")
            if first == 1 && second == newTableViewArray[first].count - 1
            {
                print("*** last element ***   \(newTableViewArray[first].last!)")
                newTableViewArray[1][second] = updatedKit
            }
        }
    }
    return newTableViewArray
}

let aNewTVArray = replaceLastLensKit(tableViewArrayIn: tableViewArray)
print(aNewTVArray)

/// replace the last element of the 2D Array tableViewArray to an edited lens kit
func replaceLastLensKit(tableViewArrayIn: [[String]], editedLensKit: String)-> [[String]] {
    
    var newTableViewArray = tableViewArrayIn
    for first in 0..<newTableViewArray.count {
        var line = ""
        print("first:\(first)")
        for second in 0..<newTableViewArray[first].count {
            
            line = String(newTableViewArray[first][second])
            print("second:\(second) = \(line)\n ")
            if first == 1 && second == newTableViewArray[first].count - 1
            {
                print("*** last element ***   \(newTableViewArray[first].last!)")
                newTableViewArray[1][second] = editedLensKit
            }
        }
    }
    return newTableViewArray
}



