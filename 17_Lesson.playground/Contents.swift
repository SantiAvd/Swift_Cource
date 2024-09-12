/*
 1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
 2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.
 3. Перегрузить оператор + и +=(добавлять число к строке) для String, но второй аргумент должен быть Int
 4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы
 */

import Foundation

//1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=

struct Point {
    var x: Int
    var y: Int
}

postfix operator -
extension Point {
   static func - (p1: Point, p2: Point) -> Point {
        return Point(x: p1.x - p2.x, y: p1.y - p2.y)
    }
    
    static func -= (p1: inout Point, p2: Point) {
        p1 = p1 - p2
    }
    
    static prefix func - (minPref: Point) -> Point {
        return Point(x: -minPref.x, y: -minPref.y)
    }
    
    static postfix func - (minPost: Point) -> Point {
        return Point(x: minPost.x - minPost.y, y: minPost.y - minPost.x)
    }
    
    static func / (p1: Point, p2: Point) -> Point {
        return Point(x: p1.x / p2.x, y: p1.y / p2.y)
    }
    
    static func /= (p1: inout Point, p2: Point) {
        p1 = p1 / p2
    }
    
    static func * (a: Point, b: Point) -> Point {
        return Point(x: a.x * b.x, y: a.y * b.y)
    }

    static func *= (p1: inout Point, p2: Point) {
        p1 = p1 * p2
    }
}


var p1 = Point(x: 4, y: 12)
var p2 = Point(x: 2, y: 6)

p1 -= p2

let negative = -p1
let minusPost = p2-

p1 = Point(x: 4, y: 12)
p2 = Point(x: 2, y: 6)

p1 / p2
p1 /= p2

p1 = Point(x: 4, y: 12)
p2 = Point(x: 2, y: 6)

p1 *= p2

//2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.

struct Size {
    var width = 0
    var height = 0
}

struct SecondPoint {
    var x = 0
    var y = 0
}

struct Rect {
    var size: Size
    var coord: SecondPoint
}

var r1 = Rect(size: Size(width: 20, height: 40), coord: SecondPoint(x: 4, y: 12))
var r2 = Rect(size: Size(width: 10, height: 20), coord: SecondPoint(x: 2, y: 6))


extension Rect {
    static func + (rect1: Rect, rect2: Rect) -> Rect {
        let rectSquare1 = rect1.size.width * rect1.size.height
        let rectSquare2 = rect2.size.width * rect2.size.height
        let squareOfSum = rectSquare1 + rectSquare2
        return Rect(size: Size(width: squareOfSum / 10 , height: 10), coord: SecondPoint(x: 0, y: 0))
    }
    
    static func - (rect1: Rect, rect2: Rect) -> Rect {
        let rectSquare1 = rect1.size.width * rect1.size.height
        let rectSquare2 = rect2.size.width * rect2.size.height
        let squareOfSum = rectSquare1 - rectSquare2
        return Rect( size: Size(width: squareOfSum / 10 , height: 10), coord: SecondPoint(x: 0, y: 0))
    }
    
    static func += (rect1: inout Rect, rect2: Rect) {
        let rectSquare1 = rect1.size.width * rect1.size.height
        let rectSquare2 = rect2.size.width * rect2.size.height
        let squareOfSum = rectSquare1 + rectSquare2
        rect1 = Rect(size: Size(width: squareOfSum / 10 , height: 10), coord: SecondPoint(x: 0, y: 0))
    }
    
    static func -= (rect1: inout Rect, rect2: Rect) {
        let rectSquare1 = rect1.size.width * rect1.size.height
        let rectSquare2 = rect2.size.width * rect2.size.height
        let squareOfSum = rectSquare1 - rectSquare2
        rect1 = Rect(size: Size(width: squareOfSum / 10 , height: 10), coord: SecondPoint(x: 0, y: 0))
    }
}

r1 + r2

r1 = Rect(size: Size(width: 20, height: 40), coord: SecondPoint(x: 4, y: 12))
r2 = Rect(size: Size(width: 10, height: 20), coord: SecondPoint(x: 2, y: 6))

r1 - r2

r1 = Rect(size: Size(width: 20, height: 40), coord: SecondPoint(x: 4, y: 12))
r2 = Rect(size: Size(width: 10, height: 20), coord: SecondPoint(x: 2, y: 6))

r1 += r2

r1 = Rect(size: Size(width: 20, height: 40), coord: SecondPoint(x: 4, y: 12))
r2 = Rect(size: Size(width: 10, height: 20), coord: SecondPoint(x: 2, y: 6))

r1 -= r2

//3. Перегрузить оператор + и +=(добавлять число к строке) для String, но второй аргумент должен быть Int

extension String {
    static func + (str1: String, str2: Int) -> String {
        let strInt = String(str2)
        let finalStr = str1 + strInt
        return finalStr
    }
    
    static  func += (str1: inout String, str2: Int) {
        str1 = str1 + str2
    }
}

var word = "hi"
var num = 23

word + num

word += num

//4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы

infix operator %*%: AdditionPrecedence

func %*% (str1: inout String, str2: String) {
    var finalStr = ""
    for letter in str1 {
        if str2.contains(letter) {
            finalStr += letter.uppercased()
        } else {
            finalStr += String(letter)
        }
        str1 = finalStr
    }
}

var st1 = "One two three"
var st2 = "I'am very tired"

st1 %*% st2
