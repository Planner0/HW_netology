// задача 1
print("----Задача 1----")
var arrBoy = ["Иван","Петр"]
var arrGirl = ["Мила","Елена","Лада"]
var students = arrGirl

//students.insert(contentsOf: arrBoy, at: 0)
for i in arrBoy.reversed() {
    students.insert(i, at: students.startIndex)
}
print(students)

print("----Задача 2----")
//students.sorted()
//students.sort(by: {$1<$0})
students.sort()
print(students)

print("----Задача 3----")

var A = [-1,4,-3,5,-2,-5]
A.sort(by: {$1<$0})
print(A)
let pozitiveFeedback = A.filter({$0>0})
print(pozitiveFeedback)
/*var z:[Int] = []
for i in A{
    if i>=0 {
    z.append(i)
    }
}
print(z)*/

print("----Задача 4----")

var ar = [1,2,3,4,7,8,15,3]

var indexA:[Int] = [] // переменная для записи индексов в сумме дающих 6

for (index1 , value1) in ar.enumerated(){
    for (index2 , value2) in ar.enumerated(){
        if value1+value2 == 6,index1 != index2,index1 > index2 {  // запись index1 != index2 исключает суммирование значений с одинаковым индексом
        indexA.append(index1)
            print("Два значения массива, которые в сумме дают 6 равны \(value1) c индексом \(index1) и \(value2) c индексом \(index2)")
        }
    }
}
//print("Два числа массива которые в сумме дают 6 равны \(ar[indexA[0]]) и \(ar[indexA[1]])") //выводит корректно если таких числа всего два

//indexA[0..<indexA.count]


//print("Индексы чисел дающие в сумме число 6 равны \(indexA[0..<indexA.count])")

/*for (index ,value1) in ar.enumerated(){
    ar.forEach({
        if ($0+value1) == 6{
        indexA.append(index)
        }
    })
}
print(indexA)*/
