import Foundation

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

