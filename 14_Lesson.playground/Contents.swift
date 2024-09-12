//Домашнее задание:
//1. Создать структуру “Описание файла” содержащую свойства:
//- путь к файлу
//- имя файла
//- максимальный размер файла на диске
//- путь к папке, содержащей этот файл
//- скрытый файл или нет
//- содержимое файла (можно просто симулировать контент)
//
//Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
//
//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
//
//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии
//- минимально возможный рост и вес
//- создайте свойство, которое будет содержать количество созданных объектов этого класса
//

//1. Создать структуру “Описание файла” содержащую свойства:
//- путь к файлу
//- имя файла
//- максимальный размер файла на диске
//- путь к папке, содержащей этот файл
//- скрытый файл или нет
//- содержимое файла (можно просто симулировать контент)
//
//Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.

enum TypeFile: String {
    case hidden = "File is hidden"
    case notHidden = "File is not hidden"
}

// попробуй поменять внутри свойства местами, чтобы повысить читаемость структуры сверху вниз
struct FileDescription {

    private enum Constants {
        static let maxSizeName = 15
        static let maxSize: Double = 10
    }
    
    let folder: String
    let content: String
    let isHidden: TypeFile
    
    var sizeFile: Double {
        didSet {
            if sizeFile > Constants.maxSize {
                sizeFile = oldValue
                print("Размер файла слишком велик")
            } else {
                print("Файл размером - \(sizeFile)")
            }
        }
    }

    var name: String {
        didSet {
            if name.count > Constants.maxSizeName {
                name = oldValue
            }
        }
    }
    
    var path: String {
        return ("\(folder) / \(name)")
    }
    
}

var file = FileDescription(folder: "MyMac/Homie", content: "esse about my expirience", isHidden: .hidden, sizeFile: 4, name: "Home Conent") 

file.name
file.folder
file.path
file.isHidden
file.sizeFile

file.sizeFile = 5.3

file.sizeFile

//2. Создайте энум, который будет представлять некую цветовую гамму.
// Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. 
// Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

enum ColorPalite: Int, CaseIterable {
    case Pink = 0xFFC0CB
    case LightPink = 0xFFB6C1
    case HotPink = 0xFF69B4
    case DeepPink = 0xFF1493
    case MediumVioletRed = 0xC71585
    case PaleVioletRed = 0xDB7093

    static let firstColor = ColorPalite.Pink
    static let lastColor = ColorPalite.PaleVioletRed
    
    var amountOfColors: Int {
        return ColorPalite.allCases.count
    }
}

//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии
//- минимально возможный рост и вес
//- создайте свойство, которое будет содержать количество созданных объектов этого класса
//

class Human {
    
    static var countOfHuman = 0
    static let minAge = 18
    static let maxAge = 45
    static let maxNameLenth = 15
    static let minNameLenth = 2
    static let minGrowth = 160
    static let minWeight = 40.0
    static let maxWeight = 95.0
    
    
    var name: String {
        didSet {
            if name.count > Human.maxNameLenth ||  name.count < Human.maxNameLenth {
                name = oldValue
                print("Введенное имя не соответсвтует параметрам")
            }
        }
    }
    
    var surName: String {
        didSet {
            if surName.count > Human.maxNameLenth || surName.count < Human.minNameLenth {
                surName = oldValue
                print("Фамилия не соответствует параметрам длинны")
            }
        }
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge || age < Human.minAge {
                age = oldValue
                print("Вы не проходите по возраcтным параметрам")
            }
        }
    }
    
    var growth: Int {
        didSet {
            if growth < Human.minGrowth {
                growth = oldValue
                print("У вас маленький рост, попейте растишки")
            }
        }
    }
    
    var weight: Double {
        didSet {
            if weight < Human.minWeight {
                weight = oldValue
                print("Вам нужно набрать массу")
            } else if weight > Human.maxWeight {
                weight = oldValue
                print("Вам нужно сбросить")
            }
        }
    }
    
    init(name: String, surName: String, age: Int, growth: Int, weight: Double) {
        self.name = name
        self.surName = surName
        self.age = age
        self.growth = growth
        self.weight = weight
        
        Human.countOfHuman += 1
    }
}

let  Alex = Human(name: "Alex", surName: "Skut", age: 30, growth: 170, weight: 79.0)
let Dima = Human(name: "Dima", surName: "Prokofiev", age: 25, growth: 180, weight: 67.0)
let Lena = Human(name: "Lena", surName: "Anikina", age: 18, growth: 169, weight: 45)

Human.countOfHuman

Alex.age = 50
Alex.weight = 100
Alex.growth = 145

Dima.age = 17

Lena.surName = "asdfjkldneastdhfk"
