/*Придумайте именованные типы Swift, подбирая лучшие абстракции. Объявите свойства и методы в них. Статический анализатор подскажет, если вы забудете кое-что ('Type annotation missing...'). На предупреждения о том, что в enum нельзя объявлять хранимые свойства и на необходимость инициализаторов в class, пока не обращайте внимания.

*Пример:
Дни недели - конечное число, подходит перечисление enum
Любая анкета - форма с данными, подходит struct
Абстракция "летчик" содержит свойства и методы, будет учиться и повышать квалификацию (меняться), увеличивать налет = class*/

//океаны
enum Ocean {
    case pacific(area:Double,volume:Double,depth:Double)
    case atlantic(area:Double,volume:Double,depth:Double)
    case indian(area:Double,volume:Double,depth:Double)
    case arctic(area:Double,volume:Double,depth:Double)
    case south(area:Double,volume:Double,depth:Double)
    case world(area:Double,volume:Double,depth:Double)
    func weather (){
    }
}
let ocean1:Ocean = .arctic(area: 14.75, volume: 18.07, depth: 1225)
let ocean2 = Ocean.indian(area: 76.14, volume: 282.65, depth: 3711)
let ocean3 = Ocean.atlantic(area: 91.66, volume: 329.66, depth: 3597)
let ocean4 = Ocean.pacific(area: 178.68, volume: 710.36, depth: 3976)
Ocean.pacific

//  Class установка частей изделия

protocol CreateTechnology { //технология изготовления детали
var item: Int {get set}//количество деталей
func createPart()//процесс изготовления детали
}
class Shaft:CreateTechnology{//изготовление вала
    var item: Int = 2
    func createPart() {
        sharpenShaft(shaft:item)//точить вал
        }
    private func sharpenShaft(shaft:Int){
    }
}
class Frame:CreateTechnology{//изготовление рамы
    var item: Int = 10
    func createPart() {
        weldingPart(framePart:item)//сварить раму
    }
    private func weldingPart(framePart:Int){}
}
protocol AssemblyTechnology {//технология сборки изделия
    func assemblyPart(for CreateTechnology:CreateTechnology) //установка детали
}
class Assembly:AssemblyTechnology{ //сборка изделия
    func assemblyPart(for createTechnology: CreateTechnology) {
        createTechnology.createPart()
        shippingPart()//перевезти
        toRizePart()//поднять
        mountingPart()//установить
        fastenerPart()//закрепить
    }
    private func shippingPart(){
    }
    private func toRizePart(){
    }
    private func mountingPart(){
    }
    private func fastenerPart(){
    }
}
let createTechnology = Frame() //создаем обьект раму
Assembly().assemblyPart(for :createTechnology) //устанавливаем в изделие



// Struct резьбовый крепеж
protocol Fastener { // абстракция резьбовый крепеж
    var threadType: String {get set} //тип резьбы
    var lenght: Int {get set} //длина крепежа
    var threadSize: Double {get set} // размер резьбы
    func mounting() //процесс установки
    
}
struct Bolt: Fastener { // болт
    var threadSize: Double
    var lenght: Int
    var threadType: String
    /*init(threadType:String,threadSize:Double,lenght:Int)
        self.threadType = threadType
        self.threadSize = threadSize
        self.lenght = lenght
        print("")*/
    func mounting() {
        print("Болт \(threadType)\(threadSize)x\(lenght) установлен")
    }}
    
let bolt1 = Bolt.init(threadSize: 4, lenght: 20, threadType: "M")
bolt1.mounting()




/*Задача 2*
Напишите по 2 примера композиции и агрегации из реального мира, без использования кода. Каждому примеру дайте объяснения почему это композиция или агрегация.
 ---Композиция -  cильная ссылка---
 Вода - водяная мельница //если вода не течет, то мельница не будет крутиться
 ток в проводах -Троллейбус // если тока нет, то троллейбус прекратит движение
 ---Агрегация - слабая ссылка---
 Светофор - пешеход // даже если горит красный цвет пешеход может идти
 Зарплата - рабочий // если не платить зарплату то рабочий все равно может работать
 */

