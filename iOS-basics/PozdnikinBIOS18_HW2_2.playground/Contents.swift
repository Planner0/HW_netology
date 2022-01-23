// часть из 3 задачи HW_2_1
var middleSalary:Int = 55000
var traineeSalary:Int = 40000
var juniorSalary:Int = 70000
middleSalary *= 2
traineeSalary += 15000
//print("\(middleSalary) \n\(traineeSalary)\n\(juniorSalary)")

//задача 1
let isCompare1:Bool = middleSalary>juniorSalary
let isCompare2:Bool = traineeSalary<middleSalary
let isCompare3:Bool = middleSalary>traineeSalary||juniorSalary<traineeSalary
let isCompare4:Bool = juniorSalary<middleSalary&&traineeSalary>middleSalary
print(isCompare1,isCompare2,isCompare3,isCompare4)

//задача 2
let message1 = "График скорее всего продолжит направление"
let message2 = "График скорее всего поменяет направление"
let message3 = "Неопределенная ситуация - нужно ждать"
var A:Float = 2.55
var B:Float = 85.55
var C:Float = 55.23
var D = 0.1 //B*B-4*A*C
//оператор if
if D > 0 {
    print(message1)
} else if D < 0 {
    print(message2)
} else {
    print(message3)
}
//тернарный оператор
D > 0 ? print(message1) : D < 0 ? print(message2): print(message3)
//оператор switch
switch D {
case 0:
    print(message3)
case ..<0:
    print(message2)
default:
    print(message1)
}

//задача 3
// фильтр материалов по полу и возрасту

let stringOnefemale = "Детский контент для девочек"
let stringOnemale = "Детский контент для мальчиков"
let stringTwomale = "Взрослый контент для мужчин"
let stringTwofemale = "Взрослый контент для женщин"
let stringThreemale = "Контент для мужчин пожилого возраста"
let stringThreefemale = "Контент для женщин пожилого возраста"
var isMale:Bool = false //мужской пол - true, женский - false
var ageMan:Int = 70
/*if isMale {
switch ageMan {
case ..<3:
    print("мультфильм Босс молокосос еще не вышел в прокат 👶")
case 3...17:
    print (stringOnemale)
case 18...65:
    print(stringTwomale)
case 66...120:
    print(stringThreemale)
case 121...289:
    print("Специально для вас лучшая подборка фильмов про вампиров🧛🏻‍♂️")
default:
    print("Нет подходящего контента")
    }
} else {
    switch ageMan {
    case ..<3:
        print("мультфильм Босс молокосос еще не вышел в прокат 👶")
    case 3...17:
        print (stringOnefemale)
    case 18...65:
        print(stringTwofemale)
    case 66...120:
        print(stringThreefemale)
    case 121...289:
        print("Специально для вас лучшая подборка фильмов про вампиров🧛🏻‍♀️")
    default:
        print("Нет подходящего контента")
        }
}*/
//var a = isMale ? "мальчиков" : "девочек"
switch ageMan {
case 3...17:
    print ("Детский контент для \(isMale ? "мальчиков" : "девочек").")
case 18...65:
    print ("Взрослый контент для \(isMale ? "мужчин" : "женщин").")
case 66...:
    print ("Контент для \(isMale ? "мужчин" : "женщин") пожилого возраста.")
default:
    print("Нет подходящего контента")
    }
