//5. Базовые операторы

/* Задания:
 1. Посчитатькол-во секунд от начала года до ДР
 2. Посчитать в каком квартале я родился
 3. 2 числа от 1 до 8 и выяснить на каком поле шахматной доски они стоят белом/черном
*/

/* 1 Задание:
 Посчитатькол-во секунд от начала года до ДР
*/

let days = 31 + 28 + 31 + 30 + 31 + 23
let hours = days * 24
let minutes = hours * 60
let seconds = minutes * 60

print("До моего ДР от начала года -> \(seconds) секунд")

/* 2 Задание:
 Посчитать в каком квартале я родился
 */

let monthOfMyBirthday = 6

switch monthOfMyBirthday {
    case 1...3: print("Я родился в 1-м квартале")
    case 4...6: print("Я родился в 2-м квартале")
    case 7...9: print("Я родился в 3-м квартале")
    case 10...12: print("Я родился в 4-м квартале")
    default: print("Некорректная дата рождения")
}

/* 3 Задание:
  2 числа от 1 до 8 и выяснить на каком пое шахматной доски они стоят белом/черном
 */

let randomFirstNum = Int.random(in: 1...8)
let randomSecondNum = Int.random(in: 1...8)

if ((randomFirstNum + randomSecondNum) % 2) == 0 {
    print("black")
} else {
    print("white")
}

