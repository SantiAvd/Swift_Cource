//Homework

// 1 Создайте массив на основе следующего перечисления:
//enum CarBrand {
// case toyota
// case honda
// case bmv
// case tesla
//}
//Выведете на консоль сообщение: “Снижение цены на 30%”,  в том случае если в списке будет .toyota

enum CarBrand {
    case toyota
    case honda
    case bmv
    case tesla
}

let carBrands: [CarBrand] = [.bmv, .honda, .tesla, .toyota]

for brend in carBrands {
    if brend == .toyota {
        print("Снижение цены на 30%")
    } else {
        print("Снижение цены на \(brend) не планируется")
    }
}

// Альтернатива
if carBrands.contains(.toyota) {
    print("Cнижение цены")
}

// Перед вами два перечисления:

//enum CarType {
// case sedan
// case suv
// case hatchback
// case truck
//}
//
//enum RoadType {
// case paved
// case gravel
//}
//Первое отвечает за тип автомобиля, а второе за тип дорожного покрытия. Продумайте алгоритм, при котором в зависимости от покрытия, будут фильтроваться типы автомобилей. Если покрытие paved то это sedan и hatchback, если gravel то suv и truck. Выведите на консоль сообщение: ” type road: <тип дороги>, cars: <список автомобилей, подходящих под эту дорогу>

enum CarType {
    case sedan
    case suv
    case hatchback
    case truck
}

enum RoadType {
    case paved
    case gravel
}

let roadType : RoadType = .gravel

switch roadType {
case .paved:
    print("type road: \(roadType), cars \(CarType.sedan), \(CarType.hatchback)")
case .gravel:
    print("type road: \(roadType), cars: \(CarType.suv), \(CarType.truck)")
}

// дайте перечисление Activity , со следующими кейсами: reading, running, shopping.
//первый кейс должен иметь ассоциативный параметр типа: (book: String), второй: (distance: Double) и третий: (items: [String]). В зависимости от, того какой кейс с типом Activity выбран, выведите на консоль сообщение, если кейс reading: “В настоящее время читаю <книга>”, если кейс running: “Пробежать сегодня <дистанция> км “, если кейс shopping: “Сходить в магазин за: <список покупок>”

enum Acrivity {
    case  reading(book: String)
    case running(distance: Double)
    case shopping(items: [String])
}

let shopItems: [String] = ["Макароны", "Хлеб", "Гранатовый сок", "Молоко"]
let reading: Acrivity = .reading(book: "Пауло Коэльо - Алхимик")
let runningOutSide: Acrivity = .running(distance: 10.5)
let itemsShopping: Acrivity = .shopping(items: shopItems)

switch runningOutSide {
case .reading(let book):
    print("Сегодня я читаю \(book)")
case .running(let distance):
    print("Cегодня мне надо пробежать \(distance) км")
case .shopping(let items):
    print("Hужно купить \(items) в магазине")
}


// 1) Напишите как понимаете enumerations:что это такое, в чем их смысл, зачем нужны.
//Ваше личное мнение: как и где их можно использовать?

print(" Enumirations - это перечисления,  нужны они для того что бы создавать типы констант. Их можно примeнять для задаваемых параметов")

// 2) Написать по 5-10 enum разных типов + создать как можно больше своих enumerations.
//Главное, соблюдайте правила написания: понятность и заглавная буква в начале названия.
// распечатайте энумы через функцию можно так же через switch прогнать

enum ShopsName: CaseIterable {
    case zara
    case coton
    case nike
    case puma
    case adidas
    case kari
}

enum Cars: CaseIterable {
    case audi
    case bmv
    case mersedes
    case lexus
    case kia
    case pagani
}

enum City: CaseIterable {
    case moscow
    case sochi
    case krasnodar
    case london
    case magadan
    case vladivostok
}

enum Day: CaseIterable{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
}

enum ClothingSize: CaseIterable {
    case small
    case medium
    case large
    case extraLarge
}

let brends = ShopsName.allCases
let carBrends = Cars.allCases
let cities = City.allCases
let days = Day.allCases
let sizes = ClothingSize.allCases

func printEnums(enums: [Any]) -> String {
    var items = ""
    for item in enums {
        items.append(" \(item)")
    }
    
    return items
    
}

printEnums(enums: brends)
printEnums(enums: carBrands)
printEnums(enums: cities)
printEnums(enums: days)
printEnums(enums: sizes)

/*
 Создайте энам Person, который имеет 3 кейса: программист, таксист, моряк 🙂
 Придумайте фразу, которая будет приветствием для каждого персонажа)
 
 а) ⭐
 сохраниете это приветствие в rawValue. Создайте 3 экземпляра энама(по одному на каждый кейс) и распечатайте их приветствия)
 
 б) ⭐⭐
 создайте у энама ф-цию greeting, которая ничего не принимает, но возвращает строку. Этой строкой и будет приветствие. Ф-цию реализовать через switch. Подсказка:
 в switch нужно передавать self)
 Создайте 3 персонажа и распечатайте их приветствия)
 
 в ) ⭐⭐⭐
 создайте еще один энам Skil и его кейсами будут "водить машину", "быстро плавать", "писать код"(в коде это доолжно быть по-английски). Для каждого из кейсов энама Person сделайте ассоциативное значение skil, тип которого будет Skil. У энама Person создайте ф-цию skil, которая будет возвращать тип Skil.
 Создайте 3 экземпляра энама Person, положите их в массив, пройдитесь по массиву циклом for(можно forEach) и распечатайте скил каждого персонажа )
 
 г) ⭐⭐⭐⭐
 В энаме Skil добавьте еще 3 кеейса: бегать, прыгать, говорить) И в этом же энаме создайте вычисляемое свойство var isSpecialSkil: Bool { // реализация свойства… }
 В энаме Person создайте еще одного персонажа: лентяй и создайте вычисляемое свойство var skils: [Skil] { // … } (в этом вычисляемом свойстве для каждого персонажа должен возвращаться уникальный набор скилов:
 - девелопер: умеет писать код, говорить и прыгать(бегать он тупо не хочет ибо обленился за последние годы сидения за компом)
 - водитель такси: умеет водить машину, бегать, прыгать, говорить
 - моряк: умеет быстро плавать, бегать, прыгать он не умеет(точнее он не хочет прыгать с борта судна), говорить и неожиданно он еще и код пишет)😉
 - лентяй умеет только языком болтать
 Создайте массив персонажей, пройдитесь по нему циклом и пусть каждый персонаж поприветствет нас и скажет есть ли у него специальные навыки или нет)
 
 д) ⭐⭐⭐⭐⭐
 Для выполненного задания г)
 Создайте расширение Array  для экземпляра Skil(используейте where). В этом расширении создайте два свойства var specialSkils: [Skil] { … } и var ordinarySkills: [Skil] { … }. Одно свойство должно внутри себя иметь реализацию через filter, а второе доолжно использовать первое свойство, так как является его противоположностью.
 Используя эти свойства скажите сколько каждый персонаж имеет специальных скилов, а сколько обычных)
 */

// а) ⭐ сохраниете это приветствие в rawValue. Создайте 3 экземпляра энама(по одному на каждый кейс) и распечатайте их приветствия)

enum Person2: String {
    case programmer = "Hallo World"
    case cabbie = "Здравствуйте, в Парк Галицкого же?"
    case sailor = "Здравия желаю!"
}

func printGreeting(_ greeting: Person2) {
    print(greeting.rawValue)
}

if let greetingProgrammer = Person2(rawValue: "Hallo World") {
    printGreeting(greetingProgrammer)
}

if let greetingCabbie = Person2(rawValue: "Здравствуйте, в Парк Галицкого же?") {
    printGreeting(greetingCabbie)
}

if let greetingSailor = Person2(rawValue: "Здравия желаю!") {
    printGreeting(greetingSailor)
}

// б)⭐⭐
// создайте у энама ф-цию greeting, которая ничего не принимает, но возвращает строку. Этой строкой и будет приветствие. Ф-цию реализовать через switch. Подсказка:
// в switch нужно передавать self)
// Создайте 3 персонажа и распечатайте их приветствия)
// //

enum MorePerson {
    case Alex, Anton, Vladimir
    func greetin() -> String {
        switch self {
        case .Alex:
            return "Hi, Alex"
        case .Anton:
            return "Hi, Anton"
        case .Vladimir:
            return "Hi, Vlodimir"
        }
    }
}

let personAlex = MorePerson.Alex.greetin()
let personAnton = MorePerson.Anton.greetin()
let personVladimir = MorePerson.Vladimir.greetin()

print("\(personAnton), \(personAlex), \(personVladimir)")

// в ) ⭐⭐⭐
//создайте еще один энам Skil и его кейсами будут "водить машину", "быстро плавать", "писать код"(в коде это доолжно быть по-английски). Для каждого из кейсов энама Person сделайте ассоциативное значение skil, тип которого будет Skil. У энама Person создайте ф-цию skil, которая будет возвращать тип Skil.
//Создайте 3 экземпляра энама Person, положите их в массив, пройдитесь по массиву циклом for(можно forEach) и распечатайте скил каждого //персонажа )

enum Person: String {
    case programmer = "Привет, я программист!"
    case taxiDriver = "Привет, я таксист!"
    case sailor = "Привет, я моряк!"
    
    enum Skill {
        case drivingCar
        case swimmingFast
        case coding
        
    }
    
    func skill() -> Skill {
        switch self {
        case .programmer:
            return .coding
        case .taxiDriver:
            return .drivingCar
        case .sailor:
            return .swimmingFast
        }
    }
}

let person1 = Person.programmer
let person2 = Person.taxiDriver
let person3 = Person.sailor
let persons: [Person] = [person1, person2, person3]

for person in persons {
    switch person.skill() {
    case .drivingCar:
        print("Я умею водить машину!")
    case .swimmingFast:
        print("Я умею быстро плавать!")
    case .coding:
        print("Я умею писать код!")
    }
}

//г) ⭐⭐⭐⭐
//В энаме Skil добавьте еще 3 кеейса: бегать, прыгать, говорить) И в этом же энаме создайте вычисляемое свойство var isSpecialSkil: Bool { // реализация свойства… }
//    В энаме Person создайте еще одного персонажа: лентяй и создайте вычисляемое свойство var skils: [Skil] { // … } (в этом вычисляемом свойстве для каждого персонажа должен возвращаться уникальный набор скилов:
//        - девелопер: умеет писать код, говорить и прыгать(бегать он тупо не хочет ибо обленился за последние годы сидения за компом)
//        - водитель такси: умеет водить машину, бегать, прыгать, говорить
//        - моряк: умеет быстро плавать, бегать, прыгать он не умеет(точнее он не хочет прыгать с борта судна), говорить и неожиданно он еще и код пишет)😉
//        - лентяй умеет только языком болтать
//        Создайте массив персонажей, пройдитесь по нему циклом и пусть каждый персонаж поприветствет нас и скажет есть ли у него специальные навыки или нет)

enum Persons: String {
    case programmer = "Привет, я программист!"
    case taxiDriver = "Привет, я таксист!"
    case sailor = "Привет, я моряк!"
    case lazy
    
    enum Skill {
        case drivingCar
        case swimmingFast
        case coding
        case running
        case jumping
        case speaking
        
        var isSpecialSkill: Bool {
            switch self {
            case .coding, .drivingCar, .swimmingFast:
                return true
            default:
                return false
            }
        }
    }
    
    var skills: [Skill] {
        switch self {
        case .programmer:
            return [.coding, .speaking, .jumping]
        case .taxiDriver:
            return [.drivingCar, .running, .jumping, .speaking]
        case .sailor:
            return [.swimmingFast, .running, .speaking, .coding]
        case .lazy:
            return [.speaking]
        }
    }
}

let characters: [Persons] = [.programmer, .taxiDriver, .sailor, .lazy]

for character in characters {
    switch character {
    case .programmer:
        print("Привет! Я разработчик.")
    case .taxiDriver:
        print("Привет! Я водитель такси.")
    case .sailor:
        print("Привет! Я моряк.")
    case .lazy:
        print("Привет! Я лентяй.")
    }
    
    let hasSpecialSkills = character.skills.contains { $0.isSpecialSkill }
    if hasSpecialSkills {
        print("У меня есть специальные навыки.")
    } else {
        print("У меня нет специальных навыков.")
    }
}


