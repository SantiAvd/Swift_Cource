/* ДЗ Массивы
 1. Создать массив  с колличеством дней в каждом месяцев:
    1.1 Вывести весть массив
    1.2 Создать массив с названием месяцев
    1.3 Через фор вывести название + дни
    1.4 Создать параметризированный тюпл (месяц: кол-во дней)
    1.5 Реверснуть количество дней из 1.1
    1.6 для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
 2. (создайте массив опшинал интов и посчитайте сумму)
 - в одном случае используйте optional binding
 - в другом forced unwrapping
 - а в третьем оператор ??
 3. Создать англ алфавит в цикле пройтись по порядку и создать пустой массив string и добавить в него реверснутую версию алфавита
*/

// 1. Создать массив  с колличеством дней в каждом месяцев:

let days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

// 1.1 Bывести весь массив

print(days)

// 1.2 Cоздать массив с названием месяцев

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

// 1.3 Через for вывести название + дни

days
    .enumerated()
    .forEach { tuple in
        let (index, countOfDays) = tuple
        let mounthName = months[index]
        print("\(mounthName) - \(countOfDays)")
    }

// 1.4 Cоздать параметризированный тюпл (месяц: кол-во дней)

let daysAndMounth = [
    (31, "Январь"),
    (28, "Февраль"),
    (31, "Март"),
    (30, "Апрель"),
    (31, "Май"),
    (30, "Июнь"),
    (31, "Июль"),
    (31, "Август"),
    (30, "Сентябрь"),
    (31, "Октябрь"),
    (30, "Ноябрь"),
    (31, "Декабрь")
]

for tuple in daysAndMounth {
    print("День - \(tuple.0) Месяц - \(tuple.1)")
}

// 1.5 Реверснуть количество дней из 1.1

let daysReversed = Array(days.reversed())

print("Количество дней в месяцах в обратном порядке: \(daysReversed)")

// 1.6 для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года

var date = (month: 4, day: 20)
var sum = 0

for index in 0..<(date.month - 1) {
    sum += days[index]
}

sum += date.day

print("От начала года до 20-го Апреля - \(sum) дней \n") 

/* 2  2. (создайте массив опшинал интов и посчитайте сумму)
- в одном случае используйте optional binding
- в другом forced unwrapping
- а в третьем оператор ??
*/

// optional binding

let optionalsInts = [5, nil, 3, 2, 12]
var sumOptionalBinding = 0

for item in optionalsInts {
    if let item = item {
        sumOptionalBinding += item
    }
}

print("Сумма optional binding = \(sumOptionalBinding)")

// forced unwrapping

let optionalsInts2 = [46, nil, 153, 25, nil, 8]
var sumForcedUnwrapped = 0

for item in optionalsInts2 {
    if item != nil {
        sumForcedUnwrapped += item!
    }
}

print("сумма forced unwrapping = \(sumForcedUnwrapped)")

// Oператор "??"

let optionalsInts3 = [3 , nil, 50 , 32 , nil, 3]
var sumUnwrapp = 0

for item in optionalsInts3 {
    sumUnwrapp += item ?? 0
}

print("сумма оператора '??' = \(sumUnwrapp)")

/* 3. создайте строку алфавит и пустой массив строк
в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе
 получился массив с алфавитом задом-наперед
*/

var alphabet = "abcdefghijklmnopqrstuvwxyz"
var reversedAlphabet = [String]()

for char in alphabet.reversed() {
    reversedAlphabet.append(String(char))
}

print(reversedAlphabet)



