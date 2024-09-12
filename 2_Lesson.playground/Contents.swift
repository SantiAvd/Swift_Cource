// Урок 3. Тюплы

/* Задания
 1.Создать параметризированный тюпл с максимальным кол-вом отжиманий приседани и подтягиваний
 2.Распечатать через принт
 3.Каждый параметр через принт название+значение
 4.Еще ондин тюпл для друга
 5.В первом тюпле поменять значение переменных спомощью промежуточного значения*/

var physicalTraining = (pushUps: 30, pullUps: 12, squatt: 50)
print(physicalTraining)

print(" Отжимания    - \(physicalTraining.pushUps)\n Подтягивания - \(physicalTraining.1)\n Приседания   - \(physicalTraining.squatt)\n")

var physicalTrainingOfMyFriend = (pushUps: 20, pullUps: 15, squatt: 25) // 👍 вот здесь например првильно сделал
print(" Отжимания    - \(physicalTrainingOfMyFriend.pushUps)\n Подтягивания - \(physicalTrainingOfMyFriend.1)\n Приседания   - \(physicalTrainingOfMyFriend.squatt)\n")

// Меняем отжимания
let myPushUps = physicalTraining.pushUps
let friendPushUps = physicalTrainingOfMyFriend.pushUps

physicalTrainingOfMyFriend.pushUps = myPushUps
physicalTraining.pushUps = friendPushUps

// Меняем подтягивания
let myPullUps = physicalTrainingOfMyFriend.pullUps
let friendsPullUps = physicalTraining.pullUps

physicalTrainingOfMyFriend.pullUps = myPullUps
physicalTraining.pullUps = friendsPullUps

// Меняем приседания
let mySquatt = physicalTrainingOfMyFriend.squatt
let friendsSquatt = physicalTraining.squatt

physicalTrainingOfMyFriend.squatt = mySquatt
physicalTraining.squatt = friendsSquatt

print(" Отжимания    - \(physicalTraining.pushUps)\n Подтягивания - \(physicalTraining.1)\n Приседания   - \(physicalTraining.squatt)\n")
print(" Отжимания    - \(physicalTrainingOfMyFriend.pushUps)\n Подтягивания - \(physicalTrainingOfMyFriend.1)\n Приседания   - \(physicalTrainingOfMyFriend.squatt)\n")

let sum1 = physicalTrainingOfMyFriend.pushUps - physicalTraining.pushUps
let sum2 = physicalTrainingOfMyFriend.1 - physicalTraining.1
let sum3 = physicalTrainingOfMyFriend.squatt - physicalTraining.squatt

let tupleDiff = (pushUps: sum1, pullUps: sum2, squatt: sum3)

print(" Разница в подтягиваниях - \(tupleDiff.1)")
print(" Разница в отжиманиях - \(tupleDiff.pushUps)")
print(" Разница в приседаниях - \(tupleDiff.squatt)")


