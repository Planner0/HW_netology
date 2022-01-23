// ---- задача 1 ----

/*
 Класс: производство
 Публичный доступ любой может заказать на экземпляре(объекте) заводе изготовление деталей.
 Getter : узнать срок изготовления деталей
 
 Setter : назначить дату встречи
 
 Пример публичного метода: оформить заказ через сайт // возможность открыта для всех
 
 Пример приватного метода: процесс изготовление деталей на заводе // никто из клиентов не видит,как изготавлваются детали
 */
//---- задача 2 ----
class Donuts {
    var numberDonuts:Int
    var fillingDonut:String
    init(numberDonuts:Int,fillingDonuts:String){
        self.numberDonuts = numberDonuts
        self.fillingDonut = fillingDonuts
    }
    func eatDonuts()->String{
        print("Вы скушали пончик с \(fillingDonut) начинкой")
        return fillingDonut
    }
    func eatDonuts(numberDonuts:Int)->Int{
        print("Вы скушали \(numberDonuts) пончиков")
        return numberDonuts
    }
    func eatDonuts(fillingDonuts:String,numberDonuts:Int){
        print("Вы скушали \(numberDonuts) пончиков с \(fillingDonuts) начинкой")
    }
}
let eatSweet = Donuts(numberDonuts: 5, fillingDonuts: "Cherry")
eatSweet.fillingDonut
eatSweet.numberDonuts
eatSweet.eatDonuts(numberDonuts:eatSweet.numberDonuts)
eatSweet.eatDonuts()
eatSweet.numberDonuts = 50
eatSweet.fillingDonut = "Chocolate"
eatSweet.eatDonuts(fillingDonuts: eatSweet.fillingDonut, numberDonuts: eatSweet.numberDonuts)


//--- задача 3 ---

class Art{
    func education () {
        print("Эстетическое просвещение")
    }
}
class Theatre:Art{
    override func education() {
        super.education()
        print("Развлечение")
    }
}
let theatreBigDrama = Theatre()
theatreBigDrama.education()
let museumHermitage = Art()
museumHermitage.education()


