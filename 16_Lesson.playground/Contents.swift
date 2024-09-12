/*
 1. У нас есть базовый клас «Артист» и у него есть имя и фамилия. И есть метод «Выступление». У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод «выступление» показать в консоле имя и фамилию артиста и собственно само выступление. Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод «выступление».
 
 2. Создать базовый клас «транспортное средство» и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (all computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина, поезд и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок). Используем полиморфизм. 100 человек и 10 000 человек.
 
 3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
 - Создайте по пару объектов каждого класса.
 - Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
 - Сколько четвероногих?
 - Сколько здесь животных?
 - Сколько живых существ?
 */

//1. У нас есть базовый клас «Артист» и у него есть имя и фамилия. И есть метод «Выступление». У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод «выступление» показать в консоле имя и фамилию артиста и собственно само выступление. Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод «выступление».


class Artist {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func performance() -> String {
        return "Выступает \(firstName) \(lastName)"
    }
}

class Dancer: Artist {
    let danceGenre: String
    init(firstName: String, lastName: String, danceGenre: String) {
        self.danceGenre = danceGenre
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override func performance() -> String {
        return "Выступает \(firstName) \(lastName) с жанром танца \(danceGenre)"
    }
}

class Singer: Artist {
    var song: String
    init(firstName: String, lastName: String, song: String) {
        self.song = song
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override func performance() -> String {
        return "Выступает \(self.firstName) \(self.lastName) с песней \(self.song) "
    }
}

class Painter: Artist {
    var painting: String
    init(painting: String) {
        self.painting = painting
        super.init(firstName: "Ganxo", lastName: "Pedro")
    }
    
    override func performance() -> String {
        return "Выступает \(firstName) \(lastName) с картиной \(painting) "
    }
}

let painter = Painter(painting: "Winter forest")
let dancer = Dancer(firstName: "Genri", lastName: "Lamar", danceGenre: "Brake Dance")
let singer = Singer(firstName: "Carry", lastName: "Late", song: "mamasa")
let arrayArtist = [dancer, singer, painter]

arrayArtist
    .forEach { value in
        print(value.performance())
    }

print()
//2. Создать базовый клас «транспортное средство» и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (all computed).
//   Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина, поезд и у каждого по одному объекту.
//   В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + 
//   у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок). Используем полиморфизм. 100 человек и 10 000 человек.

class Transport {
    var speed: Int {
        return 0
    }
    
    var price: Int {
        return 0
    }
    
    var capacity: Int {
        return 0
    }
    
    func drivePrice(countOfPeople: Int, destination: Int) -> String {
        let time = destination / speed
        let sum = price * countOfPeople
        return "Ваша поездка на расстояние - \(destination) займет - \(time) ч, на сумму - \(sum)"
    }
}

class Car: Transport {
    override var speed: Int {
        return 150
    }
    
    override var price: Int {
        return 2000
    }
    
    override var capacity: Int {
        return 4
    }
    
    override func drivePrice(countOfPeople: Int, destination: Int) -> String {
        let time = destination / speed
        let sum = price * countOfPeople
        let countTransportation = countOfPeople / capacity
        return "Ваша поездка вместимостью - \(countOfPeople) человек на Машине на  расстояние - \(destination) займет - \(time) ч, на сумму - \(sum), Кол-во перевозок - \(countTransportation)"
    }
}

class AirPlayn: Transport {
    override var speed: Int {
        return 700
    }
    
    override var price: Int {
        return 10000
    }
    
    override var capacity: Int {
        return 20
    }
    
    override func drivePrice(countOfPeople: Int, destination: Int) -> String {
        let time = destination / speed
        let sum = price * countOfPeople
        let countTransportation = countOfPeople / capacity
        return "Ваш полет вместимостью - \(countOfPeople) человек на расстояние - \(destination) займет - \(time) ч, на сумму - \(sum), Кол-во перевозок - \(countTransportation)"
    }
}

class Train: Transport {
    override var speed: Int {
        return 250
    }
    
    override var price: Int {
        return 4500
    }
    
    override var capacity: Int {
        return 100
    }
    
    override func drivePrice(countOfPeople: Int, destination: Int) -> String {
        let time = destination / speed
        let sum = price * countOfPeople
        let countTransportation = countOfPeople / capacity
        return "Ваша поездка вместимостью - \(countOfPeople) человек на Поезде на расстояние - \(destination) займет - \(time) ч, на сумму - \(sum), Кол-во перевозок - \(countTransportation)"
    }
}

class Ship: Transport {
    override var speed: Int {
        return 200
    }
    
    override var price: Int {
        return 9500
    }
    
    override var capacity: Int {
        return 30
    }
    
    override func drivePrice(countOfPeople: Int, destination: Int) -> String {
        let time = destination / speed
        let sum = price * countOfPeople
        let countTransportation = countOfPeople / capacity
        return "Ваша поездка на Корабле вместимостью - \(countOfPeople) человек, на расстояние - \(destination) займет - \(time) ч, на сумму - \(sum), Кол-во перевозок - \(countTransportation)"
    }
}

let car = Car()
let airPlayn = AirPlayn()
let train = Train()
let ship = Ship()

let arrayTransports = [car, airPlayn, train, ship]

arrayTransports
    .forEach { value in
        print(value.drivePrice(countOfPeople: 100, destination: 3000))
    }

print()
//3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
//- Создайте по пару объектов каждого класса.
//- Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
//- Сколько четвероногих?
//- Сколько здесь животных?
//- Сколько живых существ?
//*/


class Essencs {
    var isClosing: Bool {
        return true
    }
    
    var isFourLegged: Bool {
        return true
    }
    
    var isAnimal: Bool {
        true
    }
    
    var isAlive: Bool {
        return true
    }
}

class People: Essencs {
    override var isClosing: Bool {
        return false
    }
    
    override var isFourLegged: Bool {
        return false
    }
    
    override var isAnimal: Bool {
        false
    }
    
    override var isAlive: Bool {
        return true
    }
}

class Crocodile: Essencs {
    override var isClosing: Bool {
        return true
    }
    
    override var isFourLegged: Bool {
        return true
    }
    
    override var isAnimal: Bool {
        return true
    }
    
    override var isAlive: Bool {
        return true
    }
}

class Dog: Essencs {
    override var isClosing: Bool {
        return false
    }
    
    override var isFourLegged: Bool {
        return true
    }
    
    override var isAnimal: Bool {
        return true
    }
    
    override var isAlive: Bool {
        return true
    }
}

class Monkey: Essencs {
    override var isClosing: Bool {
        return false
    }
    
    override var isFourLegged: Bool {
        return false
    }
    
    override var isAnimal: Bool {
        return true
    }
    
    override var isAlive: Bool {
        return true
    }
}

class Girafs: Essencs {
    override var isClosing: Bool {
        return false
    }
    
    override var isFourLegged: Bool {
        return true
    }
    
    override var isAnimal: Bool {
        return true
    }
    
    override var isAlive: Bool {
        return true
    }
}

let people = People()
let crocodyle = Crocodile()
let dog = Dog()
let monkye = Monkey()
let giraph = Girafs()

let arrayEssencs = [people, crocodyle, dog, monkye, giraph]

var countFourLegged = 0
var countClosing = 0
var countAnimal = 0
var countAlive = 0

arrayEssencs
    .forEach { value in
        if value.isClosing {
            countClosing += 1
        }
        if value.isFourLegged {
            countFourLegged += 1
        }
        if value.isAnimal {
            countAnimal += 1
        }
        if value.isAlive {
            countAlive += 1
        }
    }

print("Присмыкающихся - \(countClosing), четырех лапых - \(countFourLegged), животных - \(countAnimal), живых - \(countAlive)")
