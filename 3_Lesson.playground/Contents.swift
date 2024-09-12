// Урок 4 Опциональные типы

/* Задания
 1. Создать 5 констант типа «строка». Константы могут содержать только цифры, цифры и буквы, только буквы. Найти сумму всех констант, приведя их к Int. При переводе применять Optional binding и принудительное разворачивание.
 
 2. Получаем ответ от сервера в виде тюпла  (statusCode: Int, message: String?, errorMessage: String?). Если statusCode от 200 до 300 включительно, то показать message, если в другом диапазоне, то показать errorMessage. После этого создать такой же тюпл в котором statusCode нет. Есть только message и errorMessage. Один из них nil, а другой всегда содержит что-то. Нужно разобраться что из них что содержит и показать соответствующую строку.
 
 3. Создать тюпл студента (имя, номер машины, оценка за предыдущую контрольную). Попрактиковаться где нужно ставить ? или ! При создании тюпла в нем не должно быть данных. Создать 5 тюплов для 5 разных студентов. Заполняем сначала имена студентов. Потом если есть машина, то добавить номер и потом добавить результат контрольной (от 0 до 5). Если не писал контрольную, то nil.  Вывести через print имя студента, какая машина если есть. Если нет, то написать. И на сколько сдал предыдущую контрольную и был ли он на ней.
 */

// 1 Создать 5 констант типа «строка». Константы могут содержать только цифры, цифры и буквы, только буквы. Найти сумму всех констант, приведя их к Int. При переводе применять Optional binding и принудительное разворачивание

let firstNum: Int? = 55
let secondNum: Int? = nil
let thirdNum: Int? = 57
let foursNum: Int? = 89

var sum = 0

if let number = firstNum {
    sum += number
}

if let number = secondNum {
    sum += number
} else {
    print("nil")
}

if let number = thirdNum {
    sum += number
} else {
    print("nil")
}

if let number = foursNum {
    sum += number
} else {
    print("nil")
}

print(sum)

//Другая вариация 1-го задания

let first = "55"
let second = "aa"
let third = "8a"
let fours = "89"

var sum2 = 0

[first, second, third, fours]
    .forEach { str in
        let intValue = Int(str)
        if let newValue = intValue {
            sum2 += newValue
        }
    }

print(sum2)

// 2 задание
/*
   Получаем ответ от сервера в виде тюпла  (statusCode: Int, message: String?, errorMessage: String?). Если statusCode от 200 до 300 включительно, то показать message, если в другом диапазоне, то показать errorMessage. После этого создать такой же тюпл в котором statusCode нет. Есть только message и errorMessage. Один из них nil, а другой всегда содержит что-то. Нужно разобраться что из них что содержит и показать соответствующую строку.
 */

let response: (statusCode: Int, message: String?, errorMessage: String?) = (statusCode: 404, message: "Успешный ответ", errorMessage: "Ошибка сервера")

if 200...300 ~= response.statusCode {
    if let message = response.message {
        print("Сообщение от сервера: \(message)")
    }
} else {
    if let errorMessage = response.errorMessage {
        print("Ошибка от сервера: \(errorMessage)")
    }
}

let newResponse: (message: String?, errorMessage: String?) = (message: "Новое сообщение", errorMessage: nil)

if let message = newResponse.message {
    print("Сообщение: \(message)\n")
} else {
     if let errorMessage = newResponse.errorMessage {
        print("Ошибка: \(errorMessage)\n")
    }
}

// 3 задание
/*
 Создать тюпл студента (имя, номер машины, оценка за предыдущую контрольную). Попрактиковаться где нужно ставить ? или ! При создании тюпла в нем не должно быть данных. Создать 5 тюплов для 5 разных студентов. Заполняем сначала имена студентов. Потом если есть машина, то добавить номер и потом добавить результат контрольной (от 0 до 5). Если не писал контрольную, то nil.  Вывести через print имя студента, какая машина если есть. Если нет, то написать. И на сколько сдал предыдущую контрольную и был ли он на ней.
 */

let student1: (name: String, carNumber: String?, previousExamScore: Int?) = ("John", nil, nil)
let student2: (name: String, carNumber: String?, previousExamScore: Int?) = ("Emily", "ABC123", nil)
let student3: (name: String, carNumber: String?, previousExamScore: Int?) = ("Michael", "XYZ789", 4)
let student4: (name: String, carNumber: String?, previousExamScore: Int?) = ("Sarah", nil, 3)
let student5: (name: String, carNumber: String?, previousExamScore: Int?) = ("David", "DEF456", 5)

print("Студент 1: \(student1.name), Машина: \(student1.carNumber ?? "Нет машины"), Оценка за предыдущую контрольную: \(student1.previousExamScore != nil ? "\(student1.previousExamScore!)" : "Не писал контрольную")\n")

print("Студент 2: \(student2.name), Машина: \(student2.carNumber ?? "Нет машины"), Оценка за предыдущую контрольную: \(student2.previousExamScore != nil ? "\(student2.previousExamScore!)" : "Не писал контрольную")\n")

print("Студент 3: \(student3.name), Машина: \(student3.carNumber ?? "Нет машины"), Оценка за предыдущую контрольную: \(student3.previousExamScore != nil ? "\(student3.previousExamScore!)" : "Не писал контрольную")\n")

print("Студент 4: \(student4.name), Машина: \(student4.carNumber ?? "Нет машины"), Оценка за предыдущую контрольную: \(student4.previousExamScore != nil ? "\(student4.previousExamScore!)" : "Не писал контрольную")\n")

print("Студент 5: \(student5.name), Машина: \(student5.carNumber ?? "Нет машины"), Оценка за предыдущую контрольную: \(student5.previousExamScore != nil ? "\(student5.previousExamScore!)" : "Не писал контрольную")\n")
