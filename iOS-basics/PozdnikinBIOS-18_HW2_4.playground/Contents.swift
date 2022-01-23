// задача 1-1
print("------Task 1-1------")
var animalOne:String? = "monkey"
var animalTwo:String? = "elephant"
var animalThree:String? = nil
print("\(animalOne ?? "Клетка пуста")\n\(animalTwo ?? "Клетка пуста")\n\(animalThree ?? "Клетка пуста")")
animalThree = "snake"
print("\(animalOne ?? "Клетка пуста")\n\(animalTwo ?? "Клетка пуста")\n\(animalThree ?? "Клетка пуста")")

//задача 1-2
print("------Task 1-2------")
let one:String = "12"
let two:String = "20"
let three:String = "3hh"
let four:String = "455hgg"
let five:String = "80"

//optional binding

/*if let oneInt = Int(one),let twoInt = Int(two), let threeInt = Int(three),let fourInt = Int(four), let fiveInt = Int(five){
    print(oneInt+twoInt+threeInt+fourInt+fiveInt)
} else {
    print ("Error")
}*/

var summ = 0
if let oneInt = Int(one){
    summ+=oneInt
} else {
    print("Данные повреждены")
}
if let twoInt = Int(two){
    summ+=twoInt
} else {
    print("Данные повреждены")
}
if let threeInt = Int(three){
    summ+=threeInt
} else {
    print("Данные повреждены")
}
if let fourInt = Int(four){
    summ+=fourInt
} else {
    print("Данные повреждены")
}
if let fiveInt = Int(five){
    //print (fiveInt)
    summ+=fiveInt
} else {
    print("Данные повреждены")
}
print("Сумма неповрежденных данных равна = \(summ)")

//forced unwrapping

/*if Int(one) != nil, Int(two) != nil, Int(three) != nil, Int(four) != nil, Int(five) != nil{
    print(Int(one)!+Int(two)!+Int(three)!+Int(four)!+Int(five)!)
} else{
    print("Error")
}*/

var summ2 = 0
if Int(one) != nil {
    //print (Int(one)!)
    summ2+=Int(one)!
} else {
    print("Данные повреждены")
}
if  Int(two) != nil{
    summ2+=Int(two)!
} else {
    print("Данные повреждены")
}
if Int(three) != nil{
    summ2+=Int(three)!
} else {
    print("Данные повреждены")
}
if Int(four) != nil{
    summ2+=Int(four)!
} else {
    print("Данные повреждены")
}
if Int(five) != nil{
    summ2+=Int(five)!
} else {
    print("Данные повреждены")
}
print("Сумма неповрежденных данных равна = \(summ2)")
 
//задача 2
print("-------Task 2-------")
let t: Int? = Int("-18")

if let tt = t {
 if tt>=0 && tt<10{
   print ("Выходим из зимней спячки")
} else if tt<0 && tt>=(-10){
    print("Зима близко")
} else if tt<(-10){
    print ("Надеваем валенки")
}  else if tt>=10 {
    print("Готовим плавки")
}} else{
    print("Ошибка данных")
}

if let ttt = t {
    switch ttt {
case (0..<10):
    print("Выходим из зимней спячки")
case ((-10)..<0):
    print("Зима близко")
case (..<(-10)):
    print("Надеваем валенки")
default:
    print("Готовим плавки")
    }}else{
    print("Ошибка данных")
}
