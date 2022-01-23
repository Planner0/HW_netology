print("---Задача 1---")

var favorFriend1 = (film:"Джентельмены",number:25,meal:"Жаркое")
let (film,number,meal) = favorFriend1
var favorFriend2 = (film:"Операция Ы",number:7,meal:"Пицца")
var favorFriend0:(film:String,number:Int,meal:String)? = nil
//if let favorFriend0:(String,Int,String)? = favorFriend1 {
favorFriend0 = favorFriend1
favorFriend1 = favorFriend2
favorFriend2 = favorFriend0!
print(favorFriend1,favorFriend2)
var favorF:(Int,Int,Int) = (favorFriend1.number,favorFriend2.number,favorFriend1.number-favorFriend2.number)
print(favorF)

print("---Задача 2---")
//ver.1
var dicItem = [["Алгебра":5,"Литература":4,"Физика":5],["Алгебра":4,"Литература":5,"Физика":4],["Алгебра":3,"Литература":2,"Физика":3]]
var students = ["Иван Иванов":dicItem[0],"Петр Петров":dicItem[1],"Алексей Алехин":dicItem[2]]
print(students["Алексей Алехин"] ?? "ошибка")

//ver.2
let student = ["Alex","Elena","Anton"]
let data =  [["Алгебра":5,"Физика":5,"Литература":5],["Алгебра":4,"Литература":5,"Физика":4],["Алгебра":3,"Литература":2,"Физика":3]]
type(of: data)
var seq2 = zip(student,data)
var dic = Dictionary(uniqueKeysWithValues: seq2)
print(dic)
print(dic["Alex"] ?? "ошибка")

print("---Задача 3---")
typealias Chessman = [String:(alfa:Character, num:Int)?] //псевдоним типа
var Chessmans:Chessman = ["wite Horse":(alfa:"h",num:6),"wite King": nil,"black Rook":(alfa:"c",num:3)]
var fig = "wite Horse"
if let info = Chessmans[fig]! {
    print("Координаты фигуры \(fig) \(String(info.alfa) + String(info.num))")
} else {
    print("Фигура \(fig) взята")
}
print("---Задача 4---")
for key in Chessmans.keys {
    if let info2 = Chessmans[key]! {
        print("Координаты фигуры \(key) \(String(info2.alfa) + String(info2.num))")
    }else{
        print("Фигура \(key) взята")
    }
}
