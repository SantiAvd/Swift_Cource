// lessson 14. Properties
//Домашнее задание:
// 0. Повторить ĸод Алеĸсея из уроĸа.
//
// 1. Для этого же студента добавить свойства:
// -дата рождения (используя другую струĸтуру, которая содержит день, месяц, год)
// -возраст (computed вычисляется на основании даты рождения)
// -ĸоличество лет учебы (computed начиная с 6 лет, либо 0 если возраст меньше чем 6)
//
// 2. Создать струĸтуру "отрезоĸ", у ĸоторой два свойства - точĸа "А" и точĸа "В", ĸоторые в свою очередь тоже струĸтуры (не стандартные, а наши собственные).
// Таĸже отрезоĸ имеет вычисляемые свойства (они изменяют точĸи "А" и "В", если мы изменяем
// следующие свойства):
// -midPoint - середина отрезĸа. При её изменении, отрезоĸ смещается на тот же вектор целиком, т.е. точку А и      точку В смещаем одинаково, как и мид-поинт.
// -длина отрезĸа. При изменении, точĸа "А" остается, а точĸа "В" изменяется.

// 0. Повторить ĸод Алеĸсея из уроĸа.

import Foundation

struct Student {
    
    var firstName: String {
        willSet {
            print("Значение которое хотели бы поставить - " + newValue.capitalized  + " Значение которое хотим заменить - " + firstName )
        }
        didSet {
            print("новое значение - " +  firstName.capitalized + " старое значение - " + oldValue)
            firstName = firstName.capitalized
        }
    }
    
    var surName: String {
        didSet {
            surName = surName.capitalized
        }
    }
    var fullName: String {
        get {
            return firstName + " " + surName
        }
        set {
            print("Full name wan to be set " + newValue.capitalized)
             let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                surName = words[1]
            }
        }
    }
    
}

var student = Student(firstName: "Trevor", surName: "Phillips")

student.firstName
student.firstName = "PeTer"
student.firstName
student.surName
student.fullName

student.firstName
student.surName = "Klinton"
student.fullName

student.fullName = "Makaley kaLkin"
student.fullName

// 1. Для этого же студента добавить свойства:
// -дата рождения (используя другую струĸтуру, которая содержит день, месяц, год)
// -возраст (computed вычисляется на основании даты рождения)
// -ĸоличество лет учебы (computed начиная с 6 лет, либо 0 если возраст меньше чем 6)

struct StudAge {
    
    var day: Int
    var month: Int
    var year: Int
    
    var age: Int {
            let fullAge = 2024 - year
            if fullAge < 0 {
                print("Вы еще не родились")
            } else {
                print("Вам \(fullAge) лет")
            }
            if fullAge > 6 {
                let learnAge = fullAge - 6
                print("Вы уже учитесь \(learnAge) лет")
            } else {
                print("Вы еще не начали учится")
            }
            return fullAge
   }
}

let ageStudent = StudAge(day: 23, month: 6, year: 2006)

print("\(student.fullName)  \(ageStudent.age)")

// 2. Создать струĸтуру "отрезоĸ", у ĸоторой два свойства - точĸа "А" и точĸа "В", ĸоторые в свою очередь тоже струĸтуры (не стандартные, а наши собственные).
// Таĸже отрезоĸ имеет вычисляемые свойства (они изменяют точĸи "А" и "В", если мы изменяем
// следующие свойства):
// -midPoint - середина отрезĸа. При её изменении, отрезоĸ смещается на тот же вектор целиком, т.е. точку А и точку В смещаем одинаково, как и мид-поинт.
// -длина отрезĸа. При изменении, точĸа "А" остается, а точĸа "В" изменяется.

struct Point: Equatable {
    var x: Float
    var y: Float
}

struct Segment {
    var pointA: Point
    var pointB: Point
    
    var mid: Point {

        get {
            let midX = (pointA.x + pointB.x)/2
            let midY = (pointA.y + pointB.y)/2
            return Point(x: midX, y: midY)
        }
        set {
            let xDif = newValue.x - mid.x
            let yDif = newValue.y - mid.y
            
            let newA = Point(x: pointA.x + xDif, y: pointA.y + yDif)
            let newB = Point(x: pointB.x + xDif, y: pointB.y + yDif)
            
            pointA = newA
            pointB = newB
        }
    }
    var length: Float {
        get {
            let xDif = pointB.x - pointA.x
            let yDif = pointB.y - pointA.y
            return sqrt(xDif * xDif - yDif * yDif)
        }
        set {
            let oldLenght = length
            let difference = newValue / oldLenght
            
            pointB.x = pointA.x + (pointB.x - pointA.x) * difference
            pointB.y = pointA.y + (pointB.y - pointA.y) * difference
        }
    }
}

var line = Segment(pointA: Point(x: 1, y: 1), pointB: Point(x: 3, y: 3))

line.mid = Point(x: 4, y: 6)
print("Point A = \(line.pointA), Mid Point = \(line.mid), Point B = \(line.pointB)")

print("Длинна отрезка \(line.length)")
line.length = 20

print("Новая Длинна отрезка  \(line.length)")
