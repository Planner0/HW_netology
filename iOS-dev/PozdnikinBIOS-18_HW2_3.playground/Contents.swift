/*
 Тип для Замыкания: на входе два параметра Double, На Выходе Double.

 Задача 1
 История:
 Вы разрабатываете спутник для полета на Европу (спутник Юпитера). В вашей команде два ученых по космодинамике. Вы даете каждому из них задачу расcчитать количество топлива для достижения спутником цели.

 Данные, которые они получают — это вес спутника и длина полета. Они должны вам предоставить свои алгоритмы расчета расхода топлива (это ваши замыкания). А вы по готовности алгоритмов делаете обработку данных и сравниваете результат (это ваша функция).

 Алгоритм выполнения
- Написать функцию с входящим параметром — замыкание (тип указан выше). Функция должна выводить в консоль результат выполнения замыкания.
- Написать два замыкания (тип указан выше). Внутри должна быть математическая операция (на ваш выбор) над входящими значениями.
- Вызвать функцию для первого замыкания и потом для второго замыкания.
- Выполнить задание, не сокращая синтаксис языка.
 */
print("---task 1---")
func fuelConsumption(_ weight:Double,_ distance:Double,_ fuelVolume:(Double,Double)->Double)->Double{
    return fuelVolume(weight, distance)
}
let fuelCalcilationOne = {(weight:Double,distance:Double)->Double in
    return weight*distance
}

let fuelCalculationTwo = {(weight:Double,distance:Double)->Double in
    return weight/distance
}
fuelCalcilationOne(10.5,50.6)
fuelCalculationTwo(10.5,50.6)
print(fuelConsumption(10.5,50.6,fuelCalcilationOne))
print(fuelConsumption(10.5,50.6,fuelCalculationTwo))
fuelConsumption(722, 628300000){(a:Double,b:Double)->Double in return a+b} //trailing closure
/*
 Задача 2
 История:
 В вашем конструкторском бюро случилось ЧП и все компьютеры вышли из строя, но последние алгоритмы вы помните. Вы намерены добраться до ближайшего компьютера в соседнем селе и восстановить из своей памяти нужные данные. Ваша задача запомнить максимально краткую форму записи алгоритмов, чтобы все не смешалось в голове.

 Алгоритм выполнения
 Представить задание 1 в сокращенном виде (см. пункт лекции "Сокращения для замыканий").
*/
print("---task 2---")
func fuelConsumption1(_ fuelVolume:(Double,Double)->Double)->Double{
    let weight = 10.5
    let distance = 50.6
    return fuelVolume(weight, distance)
}

print(fuelConsumption1{$0/$1})
print(fuelConsumption1{$0*$1})
fuelConsumption1(/)
fuelConsumption1(*)

/*
 Задача 3 * (задача со звездочкой):
 История:
 Пока вы добирались до села с компьютером, вам пришла в голову мысль своего алгоритма. Вы решили использовать свою функцию для проверки гипотезы и стали набирать алгоритм прямо в ней (реализация замыкания вместо параметра).

 Алгоритм выполнения
 Вызвать функцию из задания 1, определив ей замыкание самостоятельно (не передавая).

 Объяснить, куда и почему исчезло ключевое слово ('param' - в примере) для параметра.

 Пример:
 func example(param: () -> Void) {
     // ...
 }
     
 example {
     // ...
 } */
print("---task 3---")

let newAlgoritm = fuelConsumption1 {(weight:Double,distance:Double)->Double in
    let weight = 12.5
    let distance = 50.6
    return weight+distance
}
print(newAlgoritm)
fuelConsumption1(+)


func example(param:() -> Void) { //  типом параметра param является замыкание без параметров с пустым возвращаемым типом
    print("используем синтаксис последующего замыкания")
}
example {      //"param" это ярлых аргумента замыкания и его не нужно писать в случае вызова функции, если используется синтаксис последующего замыкания
}
/*example {()->Void in
    return print("By")
}
var hello:()->Void = {() in print("message")}
type(of: hello)
example(param: hello)  //вызов функции example с именем параметра param: а переменная hello типа ()->Void
example {              //вызов функции example с обращением к hello() т.e. к замыканию типа ()->Void
    hello()
}*/

