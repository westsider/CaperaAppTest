import Foundation
import UIKit

//// sin(45 * Double.pi / 180)
//(2.0).squareRoot()
//// 1.414213562373095
//max(5, 10)
//// 10
//
//min(-5, -10)
//// -10
//
//let myAge: Int = 53
//var averageAge: Double = 53
//averageAge = (53 + 30) / 2
//let testNumber = 11
//let evenOdd = testNumber % 2
//
//var age: Int = 16
//print(age)
//age = 30
//print(age)
//
//let voltage: Double = 120
//let current: Double = 20
//let amp = voltage * current
//let resistance = amp / pow(amp, 2)
//
//let randomNumber = arc4random() % 2
//let diceRoll = randomNumber
//
//// x = (-b ± sqrt(b² - 4⋅a⋅c)) / (2⋅a)
//var a = 10.0, b = 20.0 , c = 30.0
//
//let root1: Double = (-b + (b * b - 4 * a * c).squareRoot()) / (2 * a)


//let myAge: Int = 53
//let isTeenager: Bool = myAge > 13 && myAge < 19
//let theirAge = 30
//let bothTeenagers = theirAge > 13 && theirAge < 19 && myAge > 13 && myAge < 19
//let reader = "Warren"
//let author = "Matt Galloway"
//let authorIsReader = reader == author
//let readerBeforeAuthor = reader < author

//var counter = 0
////while counter < 10 {
////    print("Counbter is \(counter)")
////    counter += 1
////}
//
//var roll = 0
//
//repeat {
//    roll = Int.random(in: 0...5)
//    counter += 1
//    print("After \(counter) rolls, roll is \(roll)")
//} while roll != 0

//let firstName = "Matt"
//
//if firstName == "Matt" {
//  let lastName = "Galloway"
//} else if firstName == "Ray" {
//  let lastName = "Wenderlich"
//}
//let fullName = firstName + " " + lastName

//var answer = true && true  // tru
//let answer1 = false || false  // fal
//let answer2 = (true && 1 != 2) || (4 > 3 && 100 < 1) // tru
//answer = ((10 / 2) > 3) && ((10 % 2) == 0)

//let range = 1...10
//
//for num in range {
//    let sq = pow(Double(num), 2)
//    print(num * num)
//    print(sq)
//}

//var sum = 0
//for row in 0..<8 {
//  if row % 2 == 0 {
//    continue
//  }
//  for column in 0..<8 {
//    sum += row * column
//  }
//}
//print(sum)
//sum = 0
//rowLoop: for row in 0..<8 where row % 2 == 1 {
//    colLoop: for column in 0..<8 {
//    sum += row * column
//  }
//}
//print(sum)

//let coordinates = (x: 3, y: 2, z: 5)
//
//switch coordinates {
//case (0, 0, 0):
//  print("Origin")
//case (let x, 0, 0):
//  print("On the x-axis at x = \(x)")
//case (0, let y, 0):
//  print("On the y-axis at y = \(y)")
//case (0, 0, let z):
//  print("On the z-axis at z = \(z)")
//case let (x, y, z):
//  print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
//}

//let data = (age: 53, name: "Warren")
//var answer = ""
//
//switch data.age {
//case 0...2:
//    answer = "Infant"
//case 3...12:
//    answer = "Child"
//case 13...19:
//    answer = "Teenager"
//case 20...39:
//    answer = "Adult"
//case 40...60:
//    answer = "Middle Aged"
//case _ where data.age > 60:
//    answer = "Senior"
//default:
//    answer = "def"
//}
//print("\(data.name) is \(answer)")

//var aLotOfAs = ""
//while aLotOfAs.count < 10 {
//  aLotOfAs += "a"
//}
//print(aLotOfAs.count)

//for num in 0...9 {
//    let a = 10 - num
//    print(a)
//}

//var sum = 0.0
//for num in 0...10 {
//    print(Double(num) * 0.1)
//}

//func printFullName(firstName: String, lastName:String) {
//    print("\(firstName) \(lastName)")
//}
//
//printFullName(firstName: "Warren", lastName: "Hansen")
//
//func printFullName(_ firstName: String, _ lastName:String) {
//    print("\(firstName) \(lastName)")
//}
//printFullName("War", "Dog")
//
//func calculateFullName(firstName: String, lastName:String) -> (full: String, len: Int) {
//    let name = firstName + " " + lastName
//    return (full: name, len: name.count)
//}
//
//let name = calculateFullName(firstName: "Rich", lastName: "Kidd")

//func add(_ a: Int, _ b: Int) -> Int {
//  a + b
//}
//var function = add
//function(4, 4)
//
//
///// add params
///// - Parameters:
/////   - function: add func value1 value2
/////   - a: first
/////   - b: second
//func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//  let result = function(a, b)
//  print(result)
//}
//printResult(add, 4, 2)

//for index in stride(from: 10, to: 22, by: 4) {
//  print(index)
//}
//// prints 10, 14, 18
//
//for index in stride(from: 10, through: 22, by: 4) {
//  print(index)
//}
// prints 10, 14, 18, and 22
//for index in stride(from: 10.0, through: 9.0, by: -0.1) {
//    print(index)
//}

//func isNumberDivisible<T: Numeric>(_ number: T, by divisor: T) -> T {
//    number + divisor
//    //number % divisor == 0
//}

//@discardableResult
//func isPrime(_ number: Int) -> Bool {
//    let max = Int(sqrt(Double(number)))
//    for num in 2...max {
//        if isNumberDivisible(number, by: num) {
//            return false
//        }
//    }
//    return true
//}
//
//isPrime(6)      // false
//isPrime(13)     // true
//isPrime(8893)   // true

//func fibonacci(_ number: Int) -> Int {
//    10
//}
//
//fibonacci(1)  // = 1
//fibonacci(2)  // = 1
//fibonacci(3)  // = 2
//fibonacci(4)  // = 3
//fibonacci(5)  // = 5
//fibonacci(10) // = 55

//var myFavoriteSong: String? = "rockets"
//
//if let song = myFavoriteSong {
//    print("the song is \(song)")
//} else {
//    print("No Song Found")
//}
//
//func divideIfWhole(_ value: Int, by divisor: Int) -> Int? {
//    if value % divisor == 0 {
//        let answer = value / divisor
//        print("Yep it divides \(answer) times")
//        return answer
//    } else {
//        print("Not divisible :{.")
//        return nil
//    }
//}
//
//let answer = divideIfWhole(10, by: 2)

//let strideArray = Array(repeating: 1, count: 6)
//print(strideArray)
//var players = ["Alice", "Bob", "Dan", "Eli", "Frank"]
//print(players.firstIndex(of: "Bob"))
//
//print(players)
//// > ["Alice", "Bob", "Dan", "Eli", "Frank"]
//if let FrankIndex = players.firstIndex(of: "Frank") {
//    players[FrankIndex] = "Franklin"
//    print(players)
//}
//// > ["Alice", "Bob", "Dan", "Eli", "Franklin"]

//var players =  ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]
//let scores = [2, 2, 8, 6, 1, 2, 1]
//
//for (i, player) in players.enumerated() {
//    print("\(player) \(scores[i])")
//}

//var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
//print(namesAndScores)
//// > ["Craig": 8, "Anna": 2, "Donna": 6, "Brian": 2]
//
//var bobData = [
//  "name": "Bob",
//  "profession": "Card Player",
//  "country": "USA"
//]
//bobData.updateValue("CA", forKey: "state")
//bobData["city"] = "San Francisco"
//
//func getCity(from:[String: String]) -> String? {
//    if let city = from["city"], let state = from["state"]{
//    return "\(city), \(state)"
//    } else {
//        return nil
//    }
//}
//
//let n = getCity(from: bobData)

//func areCharactersUnique(input: String) -> Bool {
//    return Set(input).count == input.count
//}
//
//
//areCharactersUnique(input: "abcdefga")
//
//func isPalandrome(input: String) -> Bool {
//    let lowercased = input.lowercased()
//    return lowercased == String(lowercased.reversed())
//}
//
//isPalandrome(input: "wannah")

func challenge3a(string1: String, string2: String) -> Bool {
    var checkString = string2

    for letter in string1 {
        if let index = checkString.firstIndex(of: letter) {
            checkString.remove(at: index)
        } else {
            return false
        }
    }
    return checkString.count == 0
}

extension String {
    func fuzzyContains(_ string: String) -> Bool {
        return self.uppercased().range(of: string.uppercased()) != nil
    }
}

func challenge5a(input: String, count: Character) -> Int {
    var letterCount = 0

    for letter in input {
        if letter == count {
            letterCount += 1
        }
    }

    return letterCount
}

func challenge5d(input: String, count: String) -> Int {
    let modified = input.replacingOccurrences(of: count, with: "")
    return input.count - modified.count
}

func challenge7(input: String) -> String {
    let components = input.components(separatedBy: .whitespacesAndNewlines)
    return components.filter { !$0.isEmpty }.joined(separator: " ")
}

func challenge7a(input: String) -> String {
    var seenSpace = false
    var returnValue = ""

        for letter in input {
            if letter == " " {
                if seenSpace { continue }
                seenSpace = true
            } else {
                seenSpace = false
            }

            returnValue.append(letter)
        }

        return returnValue
    }

func challenge8(input: String, rotated: String) -> Bool {
    guard input.count == rotated.count else { return false }
    let combined = input + input
    return combined.contains(rotated)
}

func challenge9(input: String) -> Bool {
    let set = Set(input.lowercased())
    let letters = set.filter { $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}

func challenge10a(input: String) -> (vowels: Int, consonants: Int) {
    let vowels = CharacterSet(charactersIn: "aeiou")
    let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstvwxyz")
    var vowelCount = 0
    var consonantCount = 0

    for letter in input.lowercased() {
        let stringLetter = String(letter)

        if stringLetter.rangeOfCharacter(from: vowels) != nil {
            vowelCount += 1
        } else if stringLetter.rangeOfCharacter(from: consonants) != nil {
            consonantCount += 1
        }
    }
    return (vowelCount, consonantCount)
}

func challenge12(input: String) -> String {
    let parts = input.components(separatedBy: " ")
    guard let first = parts.first else { return "" }

    var currentPrefix = ""
    var bestPrefix = ""

    for letter in first {
        currentPrefix.append(letter)

        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }

        bestPrefix = currentPrefix
    }

    return bestPrefix
}

let voidClosure: () -> Void = {
  print("Swift Apprentice is awesome!")
}
voidClosure()



/*
 A FunkyNotificationCenter object provides a mechanism for broadcasting
 information within a program. A FunkyNotificationCenter object is essentially
 a notification dispatch table.

 Objects register with a notification center to receive notifications
 (Notification objects) using the add(forName:object:using:) method.
 Each invocation of this method specifies a notification name.
 Objects may register as observers of different notification
 name by calling this method several times.

 Objects can post notifications using the post(name:) method. All objects
 registered to the notification name will have their correpsonding
 closure executed.

 Objects can unregister itself from one or all notifications by using the
 remove(forName:object:) method.

 */

/*
 class FunkyNotificationCenter {
     
     /**
     The default FunkyNotificationCenter singleton
     */
     static var defaultCenter = FunkyNotificationCenter()

   var names: [String: [((String) -> Void)]]?
     /**
     Add the given observer object to the notification name. When the given notification name
     is posted, the given `using` closure should be executed.
     
     - Parameters:
         - forName: The notification name the object is observing
         - object: The observer object that is requesting to listen to the notification
         - using: Closure to be executed when the notification is posted
     */
     func add(forName name: String, object: AnyObject, using: @escaping (String) -> Void) {
        
       // guard let name =  names?[name] else { return }
        names?[name]?.append(using)
       
     }

     /**
     Post a notification with the given name.
     
     - Parameters:
         - name: The notification to post
     */
     func post(name: String) {
         // TODO
        let values = names?[name]
        value(name)
     }

     /**
     Remove the observer object from the given notification name
     
     - Parameters:
         - forName: The notification name the object is observing
         - object: The observer object that is requesting to no longer listen to the notification
     */
     func remove(forName name: String, object: AnyObject) {
         // TODO
         names[name] = nil
     }

 }




 /*******************************************************************************
 Example Usage
 *******************************************************************************/

 class SomeObject {
 }

 let center = FunkyNotificationCenter.defaultCenter

 let objectA = SomeObject()
 center.add(forName: "notificationEvent1", object: objectA) { _ in
     print("Object A Event 1 happened")
 }
 center.add(forName: "notificationEvent2", object: objectA) { _ in
     print("Object A Event 2 happened")
 }

 let objectB = SomeObject()
 center.add(forName: "notificationEvent2", object: objectB) { _ in
     print("Object B Event 2 happened")
 }
 center.add(forName: "notificationEvent3", object: objectB) { _ in
     print("Object B Event 3 happened")
 }

 let objectC = SomeObject()
 center.add(forName: "notificationEvent3", object: objectC) { _ in
     print("Object C Event 3 happened")
 }
 center.add(forName: "notificationEvent1", object: objectC) { _ in
     print("Object C Event 1 happened")
 }

 print("Before remove Object C Event 1")
 center.post(name: "notificationEvent1")

 center.remove(forName: "notificationEvent1", object: objectC)
 print("After remove Object C Event 1")
 center.post(name: "notificationEvent1")

 /*
 Desired output:

 Before remove Object C Event 1
 Object A Event 1 happened
 Object C Event 1 happened
 After remove Object C Event 1
 Object A Event 1 happened
 */
 */
