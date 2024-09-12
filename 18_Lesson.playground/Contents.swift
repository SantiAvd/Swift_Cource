/*
 Урок 23 Optional chaining и Type casting
 Сегодня будем строить свою небольшую социальную сеть.
 •    Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (массивы) (всё опционально).
 
 Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
 Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд (Optional chaining)
 
 •    Все сестры, матери,… должны быть класса Женщина, Папы, братья,… класса Мужчины.
 У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
 Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
 
 •    Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки…) их может быть несколько, может и не быть вообще.
 Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть – добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
 Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
 Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
 Обязательно используем в заданиях Optional chaining и Type casting.
 */

var countInit = 0
var countDeinit = 0

class Human {
    
    let name: String
    
    init(name: String) {
        self.name = name
        countInit += 1
    }
    
    var father: Man?
    var mother: Women?
    var son: Man?
    var douther: Women?
    var brothers: [Man]?
    var sisters: [Women]?
    var grandPa: Man?
    var grandMa: Women?
    var pets: [Animal]?
    
    deinit {
        countDeinit += 1
    }
}

class Animal {
    
    let name: String
    
    init(name: String) {
        self.name = name
        countInit += 1
    }
    
    func sound() {}
    
    deinit {
        countDeinit += 1
    }
}

class Man: Human {
    
    func moveSofa() {
        print("Да двигаю я твой диван")
    }
}
    
class Women: Human {
    
    func giveInstruction() {
        print("Иди двигай диван")
    }
}

class Cat: Animal {
    
    override func sound() {
        print("The cat \(self.name) is mewing")
    }
}

class Dog: Animal {
    
    override func sound() {
        print("The dog \(self.name) is barking")
    }
}

class Bird: Animal {
    
    override func sound() {
        print("The bird \(self.name) is scrr-scrr")
    }
}

do {
    let father = Man(name: "Nikolas")
    let mother = Women(name: "Sofa")
    let brother = Man(name: "Stepan")
    let grandpa = Man(name: "Vasily")
    let grandMa = Women(name: "Anastasiya")
    let brotherOfFather = Man(name: "Peter")
    let sisterOfMother = Women(name: "Alena")
    
    let cousin1 = Man(name: "Roman")
    let cousin2 = Man(name: "Daniel")
    let cousin3 = Women(name: "Margo")
    let cousin4 = Man(name: "Alex")
    let cousin5 = Women(name: "Dariya")
    
    let human = Human(name: "Alex")
    
    human.father = father
    human.mother = mother
    human.brothers = [brother]
    human.grandMa = grandMa
    human.grandPa = grandpa
    
    father.brothers = [brotherOfFather]
    mother.sisters = [sisterOfMother]
    
    brotherOfFather.son = cousin1
    brotherOfFather.son = cousin4
    brotherOfFather.douther = cousin3
    
    sisterOfMother.douther = cousin5
    sisterOfMother.son = cousin2
    
    let allHumansInTheFamily = [
        father,
        mother,
        brother,
        grandpa,
        grandMa,
        brotherOfFather,
        sisterOfMother,
        cousin1,
        cousin2,
        cousin3,
        cousin4,
        cousin5
    ]
    
    print("All family count \(allHumansInTheFamily.count)")
    
    print()
    
    var countUncles = allHumansInTheFamily
        .filter { $0.brothers?.count != nil }
        .reduce(into: 0) { $0 += $1.brothers?.count ?? 0}
    
    var countAunts = allHumansInTheFamily
        .filter { $0.sisters?.count != nil }
        .reduce(into: 0) { $0 += $1.sisters?.count ?? 0}
    
    print("Amount of uncles is \(countUncles)")
    print("Amount of uncles is \(countAunts)")
    
    var arrMan: [Man] = []
    var arrWomen: [Women] = []
    
    for human in allHumansInTheFamily {
        switch human {
        case let human as Man:
            arrMan.append(human)
        case let human as Women:
            arrWomen.append(human)
        default:
            break
        }
    }
    print()
    
    print("Women count - \(arrWomen.count)")
    arrWomen
            .forEach { $0.giveInstruction()}
    
    print()
    
    print("Man count - \(arrMan.count)")
    arrMan
        .forEach { $0.moveSofa() }
    
    print()
    
    father.pets = [Dog(name: "Borzy"), Cat(name: "Bitter")]
    grandpa.pets = [Bird(name: "Rokie")]
    brotherOfFather.pets = [Dog(name: "Chibas"), Cat(name: "Lucky")]
    
    let none = Animal(name: "none")
    
    var countAnimals = allHumansInTheFamily
        .filter { $0.pets?.count != nil }
        .reduce(into: [Animal]()) { $0 += $1.pets ?? [none] }
    
 
    
    print("Humans has \(countAnimals.count) pets")
    
    var dogs: [Dog] = []
    var cats: [Cat] = []
    var birds: [Bird] = []
    
    var animals = countAnimals
    
    for animal in animals {
        switch animal {
        case let animal as Dog:
            dogs.append(animal)
        case let animal as Cat:
            cats.append(animal)
        case let animal as Bird:
            birds.append(animal)
        default:
            break
        }
    }
    
    print()
    
    print("They has \(dogs.count) - dogs \n \(cats.count) - cats \n \(birds.count) - birds")
    
    print()
    
    dogs.forEach { $0.sound() }
    cats.forEach { $0.sound() }
    birds.forEach { $0.sound() }
    
    print()
}

print("end")
print(countInit)
print(countDeinit)
