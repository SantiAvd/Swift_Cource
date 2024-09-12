// Урок 6.Строки
/* Задание
 1. Посчтитать сумму 5 конcтант используя "??" и все выражение пердставить в виде строки
 2. Выбрать 3 классных керректеров подсчитать ее длину с помощью count
 3. сделать английский алфавит через for найти индекс выбранной буквы и вывети его индекс
 */

/* Задание 1
 Посчтитать сумму 5 конcтант используя "??" и все выражение пердставить в виде строки
 */

let tupleNum = ("231", "323", "qr24", "2", "erq233r")

let firstNum = Int(tupleNum.0) ?? 0
let secondNum = Int(tupleNum.1) ?? 0
let thirdNum = Int(tupleNum.2) ?? 0
let fourNum = Int(tupleNum.3) ?? 0
let fifsNum = Int(tupleNum.4) ?? 0
let sum = (firstNum + secondNum + thirdNum + fourNum + fifsNum)

print("\(firstNum) + \(secondNum) + \(thirdNum) + \(fourNum) + \(fifsNum) = \(sum)")

/* Задание 2
 Выбрать 3 классных керректеров подсчитать ее длину с помощью count
 */

let monkey: Character = "\u{1F64A}"
let heart: Character = "\u{1f496}"
let smile: Character = "\u{1F601}"
let string = ("\(monkey)" + " \(heart)" + " \(smile)")
print(string.count)

/* 3 Задание //
 сделать английский алфавит через for найти индекс выбранной буквы и вывети его индекс
 */

let letter: Character = "p"
let alpphabet = "abcdefghijklmnopqrstuvwxyz"

for (index, char) in alpphabet.enumerated() where char == letter {
    print("index '\(letter)' = \(index)")
}

