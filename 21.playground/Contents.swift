/*
Урок 24 Extension
1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool(if == 0, return false).
2. Добавьте проперти, которое возвращает количество символов в числе.
3. Добавьте сабскрипт, который возвращает символ числа по индексу. Профи могут определить и сеттер.
4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его.
5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
Let s = «Hi hi hi»
s.truncate(4) // Hi h…
s.truncate(10) // Hi hi hi
*/

extension Int  {
    
    /* 1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool(if == 0, return false).*/
    
    var isNegative: Bool {
        return self < 0 ? true : false
    }
    
    var isPositive: Bool {
        return !isNegative
    }
    
    /* 2. Добавьте проперти, которое возвращает количество символов в числе.*/
    
    var countNum: Int {
        description.count
    }
    
    // 3. Добавьте сабскрипт, который возвращает символ числа по индексу. Профи могут определить и сеттер
    
    
    subscript(index: Int) -> Int? {
        get {
            let valueDescription = description
            let count = valueDescription.count
            guard (0..<count).contains(index) else { return nil }

            
            let strIndex = valueDescription.index(valueDescription.startIndex, offsetBy: count - (index + 1))
            let digitChar = valueDescription[strIndex] 
            let digitStr = String(digitChar)
            return Int(digitStr)
        }
        set {
          
            var resultStr = description
            let count = description.count
            guard (0..<count).contains(index), let newValue else { return }
            let strIndex = description.index(description.startIndex, offsetBy: count - (index + 1))
            resultStr.replaceSubrange(strIndex...strIndex, with: String(newValue))

            guard let resultInt = Int(resultStr) else { return }
            self = resultInt
        }
    }
}
var value = 356
value[1] = 789
value

extension String {
    func truncate(intIndex: Int) -> String {
        
        let dot = "..."
        
        var newString: [String] = []
        self
            .enumerated()
            .forEach { (index, value) in
                if intIndex >= index {
                    newString.append(String(value))
                }
            }
        
        var trunsStr: String {
            var str = ""
            for i in newString {
                str += i
            }
            return str
        }
        
        if intIndex >= newString.count {
            return self
        } else {
            return trunsStr + dot
        }
    }
}

let str = "hi hi hi"

print(str.truncate(intIndex:3))
