//Домашнее задание:
//ДЗ 1
// создать тип - комната с параметрами длина и ширина
// создать тип - персонаж с параметрами позиции в комнате (можно еще добавить пару свойств типа имени или чего сами хотим)
// реализовать функцию которая красиво распечатывает в консоле комнату и персонажа в ней (границы и персонаж внутри

// ДЗ 2
// добавить метод персонажу идти (например moveTo) в который передаем enum (лево/право/верх/вниз)
// персонаж должен перемещаться по комнате и сбоку отображать в консоле его перемещение
// реализовать правило по которому персонаж не сможет выйти за пределы комнаты


//ДЗ 3
// создать ящик с координатами х-у
// он по правилам не покидает пределы комнаты
// персонаж может двигать ящик
// персонаж не может находиться с ящиком в одной клетке (если ящик даже упрется в стенку)
// ящик тоже распечатывается в комнате
// создать точку в комнате, до которой надо дотащить ящик

let pers = "🧍"
let dog = "🐶"
let door = "🚪"
let field = "⬜️"

let lenthRoom = 5
let widthRoom = 5

enum Directoins {
    case back
    case forward
    case right
    case left
}

struct Point {
    var pointX: Int {
        didSet {
            pointX = pointX > 0 && pointX <= lenthRoom ? pointX : oldValue
        }
    }
    var pointY: Int {
        didSet {
            pointY = pointY > 0 && pointY <= widthRoom ? pointY : oldValue
        }
    }
}

class Human {
    var coord: Point
    
    init(coord: Point) {
        self.coord = coord
    }
    
    func move(x: Directoins, dogCoord: Dog) { 
   
        var moveDog: Directoins
        
        switch (x, dogCoord.coord.pointX, dogCoord.coord.pointY) {
        case (.back, let dogPointX, let dogPointY) where dogPointY != 0 || dogPointX != self.coord.pointX:
            self.coord.pointY -= 1
            moveDog = .back
        case (.forward, let dogPointX, let dogPointY) where dogPointY != widthRoom || dogPointX != self.coord.pointX:
            self.coord.pointY += 1
            moveDog = .forward
        case (.left, let dogPointX, let dogPointY) where dogPointX != 1 || dogPointY != self.coord.pointY:
            self.coord.pointX -= 1
            moveDog = .left
        case (.right, let dogPointX, let dogPointY) where dogPointX != lenthRoom || dogPointY != self.coord.pointY:
            self.coord.pointX += 1
            moveDog = .right
        default:
            moveDog = .back; break
        }
        if (self.coord.pointX, self.coord.pointY) == (dogCoord.coord.pointX, dogCoord.coord.pointY) {
            dogCoord.Move(x: moveDog)
        }
    }
}

class Dog {
    var coord: Point
    
    init(coords: Point) {
        self.coord = coords
    }
    
    func Move(x: Directoins) {
        switch x {
        case .back:
            self.coord.pointY -= 1
        case .forward:
            self.coord.pointY += 1
        case .left:
            self.coord.pointX -= 1
        case .right:
            self.coord.pointX += 1
        }
    }
}

func printRoom (human: Human, dogie: Dog) {
    for y in 0...widthRoom - 1 {
        for x in 0...lenthRoom - 1 {
            if x == human.coord.pointX && y == human.coord.pointY {
                print(pers, terminator: " ")
            } else if x == dogie.coord.pointX && y == dogie.coord.pointY {
                print(dog, terminator: " ")
            } else if x == lenthRoom - 2 && y == widthRoom - 1 {
                print(door, terminator: " ")
            } else {
                print(field, terminator: " ")
            }
        }
        print()
    }
    print(" ")
    print(" ")
}

var human = Human(coord: Point(pointX: 2, pointY: 2))
var dogie = Dog(coords: Point(pointX: 3, pointY: 2))

printRoom(human: human, dogie: dogie)

human.move(x: .back, dogCoord: dogie)
printRoom(human: human, dogie: dogie)

