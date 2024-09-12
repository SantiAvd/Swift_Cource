//// hOme
//Создайте класс Person, который содержит свойства name, age, gender. Определите значения по умолчанию для каждого из свойств. Класс так же должен содержать метод getDescription, который возвращает предложение со всей информацией о персоне.
//Создайте экземпляр класса, и задайте конкретные значения для свойств. Отобразите результат работы метода getDescription на консоли.

enum Gender {
    case getero
    case bi
}

class Person {
   static let descriptionperson = Person()
    
    var name = ""
    var age = 0
    var gender = Gender.getero
    
    func getDescription() -> String {
        return "\(name) - \(age); \(gender)"
    }
}

let person1 = Person.descriptionperson
person1.name = "Harry"
person1.age = 22
person1.gender = .getero

print(person1.getDescription())

//Создайте класс BankAccount, который будет содержать свойства balance и accountNumber. Создайте методы increaseDeposit и withdrawMoney, первый будет добавлять к балансу какую-то сумму, а второй уменьшать ее.

class BankAccount {
    
    static let descriptionBankAccaunt = BankAccount()
    
    var balance = 0.0
    var accountNumber = ""
    
    func increaseDeposit(amount: Double) {
        balance += amount
    }
    
    func withdrawMoney(amount: Double) {
        balance -= amount
    }
}

let userAccount = BankAccount.descriptionBankAccaunt
userAccount.accountNumber = "1234567890"

print(userAccount.balance)

userAccount.increaseDeposit(amount: 1000.0)

print(userAccount.balance)

userAccount.withdrawMoney(amount: 500.0)

print(userAccount.balance)

//Создайте класс Person, который имеет свойства firstName, lastName и fullName. Свойство fullName должно вычисляться на основе firstName и lastName. Напишите инициализатор, который принимает имя и фамилию и устанавливает их в соответствующие свойства.
//Создайте экземпляр данного класса и выведите на консоль сообщение:  “Имя: <…>, фамилия: <…>, полное имя: <…>”

class User {
    
    let firstName: String
    let lastName: String
    
    var fullName: String { return  "\(firstName) \(lastName)" }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

var user = User(firstName: "Alex", lastName: "Papiroskov")

print("Name - \(user.firstName), Second Name - \(user.lastName),  Full Name - \(user.fullName)")

//Создайте класс Lable, в котором должно быть два свойства title с типом String и titleColor с типом Color, где Color это перечисление с набором цветов. Значения для свойств класса Lable должны задаваться через инициализатор, при этом цвет должен быть не обязательным к инициализации.

enum Color: String {
    case green
      
    case red
    case blue
    case yellow
    
    var colorSet: String {
        switch self {
        case .green:
            "Зеленый"
        case .red:
            "Красный"
        case .blue:
            "Синий"
        case .yellow:
            "Желтый"
        }
    }
}

class Label {
    
    let title: String
    let titleColor: String
    
    init(title: String, color: String) {
        self.title = title
        self.titleColor = color
    }
}

let label = Label(title: "Цвет неба", color: Color.blue.colorSet)
print("\(label.title) - \(label.titleColor)")


//1.1 Создайте струĸтуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несĸольĸо эĸземпляров этой струĸтуры и заполните их данными. Положите их всех в массив (журнал).
//1.2- Напишите фунĸцию, ĸоторая принимает массив студентов и выводит в ĸонсоль данные ĸаждого. Перед выводом ĸаждого студента добавляйте порядĸовый номер в “журнале”, начиная с 1.
//1.3 С помощью фунĸции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
//1.4 Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаĸовые, а вы сделайте таĸ чтобы таĸое произошло, то сравниваются по имени. Распечатайте “журнал”.
//1.5 Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив?

struct Student {
    var name: String
    var surName: String
    var age: Int
    var midllePoint: Double
}

let journal = [
    Student(name: "Jarry", surName: "Poplovsky", age: 17, midllePoint: 3.8),
    Student(name: "Danil", surName: "Lazebny", age: 16, midllePoint: 4.3),
    Student(name: "Kobe", surName: "James", age: 18, midllePoint: 5.0),
    Student(name: "Megan", surName: "Poplovsky", age: 17, midllePoint: 4.5)
]

journal.forEach {
    print($0)
}

func printStudents(journal: [Student], task: String) {

    print("\n--- Задание \(task) -----")
    journal
        .enumerated()
        .forEach { (index, student) in
            print("\(index + 1). Фамилия - \(student.surName), Имя - \(student.name), Возраст - \(student.age), Средний бал - \(student.midllePoint)")
        }
}

let journalSortedPoint = journal.sorted { $0.midllePoint > $1.midllePoint }

printStudents(journal: journalSortedPoint, task: "1.3 Создание среднего бала")

let journalSortedSurName = journal.sorted(by: { stud1, stud2 in
    if stud1.surName != stud2.surName {
        return stud1.surName.uppercased() < stud2.surName.uppercased()
    } else {
        return stud1.name.uppercased() < stud2.name.uppercased()
    }
})

printStudents(journal: journalSortedSurName, task: "1.4 Сортировка по фамилии/имени")

// 1.4

var journal2 = journal
journal2[0].midllePoint = 2.9
journal2[0].surName = "Яшин"
journal2[0].name = "Лев"
journal2[0].age = 21

printStudents(journal: journal2, task: "1.5 Журнал 2")
printStudents(journal: journal, task: "1.5 Журнал 1")


