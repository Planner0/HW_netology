//Из презентации про "Словарь. Обход по коллекциям на примере for-in. Кортеж и множество"

/*var phones:[String:String]=["Apples":"Iphone X", "Microsoft":"Lumia 1050", "Google":"Nexus X5"]
phones.updateValue("Iphone Xr", forKey: "Apple")
print(phones)
if let a=phones["Apple"] {
    print(a)
} else{
    print("нет обьекта")
}

phones["Microsoft"]=nil
print(phones.count)

if let removeValue = phones.removeValue(forKey: "Google"){
    print("Удален обьект \(removeValue).")
} else {
    print("Словарь не содержит удаляемого элемента")
}
for (x,y) in phones{
    print(x,y)
}
for x in phones.keys{
    print(x)
}
for x in phones.values{
    print(x)
}
let countries = ["Russia","USA","Russia"]
let capitals = ["Moskow","Washington","Moskow"]
var seq = zip(capitals,countries)
/*var dic = Dictionary(uniqueKeysWithValues: seq)
print(dic)
for (key, value) in dic {
    print("\(key)-\(value)")
}*/
var dic = Dictionary(seq,uniquingKeysWith: {return $1})

for (key, value) in dic {
    print("\(key)-\(value)")
}
var User: (String,Int) = (name:"Alex", age:24)
type(of: name)
let users = [(name:"Alex", age: 24)]
             /*(name:"Nikolay", age: 4),
             User(name:"Konstantin", age: 23),
             User(name:"Anna", age: 20),
             User(name:"Maria", age: 20)]*/

//let usersInDictionary

let alex = (name: "Alex", age: 23)
let jenny = (name: "Jenny", age: 20)
let jason = (name: "Jason", age: 35)
let persons = [alex, jenny, jason]
let jNamedPersons = persons.filter { $0.name.hasPrefix("J") } // [jenny, jason]
*/


//ООП
/*struct Material {
    let brick: String
    let concrete: String
    let steel: String
    let tiles: String
}
let material = Material(brick: "1", concrete: "2", steel: "3", tiles: "4")
print(material)*/

/*protocol Fastener { // абстракция резьбовый крепеж
    var threadType: String {get set} //тип резьбы
    var lenght: Int {get set} //длина крепежа
    var threadSize: Double {get set} // размер резьбы
    
}
struct Bolt: Fastener { // болт
    var threadSize: Double
    var lenght: Int
    var threadType: String
    /*init(threadType:String,threadSize:Double,lenght:Int){
        self.threadType = threadType
        self.threadSize = threadSize
        self.lenght = lenght
        print("Болт \(threadType)\(threadSize)x\(lenght)")
    }*/
}

//установка частей изделия

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



/*protocol MethodMounting {// инструкция по установке крепежа
    var tool:String {get set} // инструмент
    var numberOfFastener :Int {get set} // количество крепежа
    func mounting() //процесс установки
}//крепить крепеж

protocol Fastener { // абстракция резьбовый крепеж
    var threadType: String {get set} //тип резьбы
    var lenght: Int {get set} //длина крепежа
    var threadSize: Double {get set} // размер резьбы
    
}
struct Bolt: Fastener { // болт
    var threadSize: Double
    var lenght: Int
    var threadType: String
    /*init(threadType:String,threadSize:Double,lenght:Int){
        self.threadType = threadType
        self.threadSize = threadSize
        self.lenght = lenght
        print("Болт \(threadType)\(threadSize)x\(lenght)")
    }*/
}
class mountingBolt:MethodMounting {
    var tool: String
    
    var numberOfFastener: Int
    
    func mounting() {
        print("Крепеж установлен")
    }
    // винт
    
}
//
var bolt1 = Bolt(threadType: "M", threadSize: 4, lenght: 10)
print(bolt1)
    //func mounting() {
        // взять инструмент
        // взять крепеж
        // установить крепеж в отверстие
        // закрутить крепеж
   // }
*/*/

/*//----Перечисления-----
enum CompassPoint:Int {  //тип данных
    case north=1
    case south
    case east
    case west
}
var directionToHead = CompassPoint.east
directionToHead = .north
print(directionToHead.rawValue)

enum Planet:Int, CaseIterable{ //для создания коллекции всех кейсов CaseIterable
    case mercury=1,venus,earth,mars,jupiter,saturn,urans,neptune
    case x
}
var myFavoritePlanet = Planet.allCases.count
print(myFavoritePlanet)
for planet in Planet.allCases{
    print(planet)
}
let planet1 = Planet.allCases
planet1[0]
print(type(of: planet1[0]))
//ассоциативные значения
enum CarModel {
    case volvo(String)
    case audi(Int)
}
var myCar = CarModel.audi(5)
myCar = .volvo("XC90")
//type(of: myCar)
switch myCar {
case let .volvo(model):
    print("My Car \(model)")
case let .audi(model):
    print("My Car \(model)")
}
//исходные значения
CompassPoint.north.rawValue
//инициализация через исходное значение
CompassPoint(rawValue: 1)
Planet(rawValue:1)
type(of: Planet(rawValue: 1))

if let a=Planet(rawValue: 11){  //безопасное извлечение через optional binding
    switch a {
    case .mercury:
        print("This is \(a)")
    default:
        print("Other planet")
    }
} else {
    print("Value is nil")
}
//рекурсивные перечисления
indirect enum ArithmeticExpression {//Рекурсивные перечисления - это такие перечисления,экземпляры которого являются ассоциативным значением одного или более кейсов перечисления.
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))

//----Структуры-----
struct House { //не требует инициалицатора init
    var floor:Int
    var bathroom:String
    func live(){
    print("Жить хорошо")
    }
}
class House1 {
    var floor1:Int
    init(floor:Int) {
        self.floor1 = floor
    }
    func live(){
    print("Жить хорошо")
    }
}
var home = House(floor: 1, bathroom: "small")
home.floor
home.live()
var  job = House1(floor: 3)
job.floor1
job.live()
*/
//Getter and Setter
/*struct Length {
    var milliMeter:Double = 5.0
    var meter:Double {
        get {   // чтение
            print("get")
            return milliMeter/1000
            
        }
        set(newValue){ // запись
            print("set")
            milliMeter = newValue*1000
        }
    }
}
var lenght = Length.init(milliMeter:50)
lenght.meter*/


//subscript
/*enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

struct Home {
    var floor:Int
    mutating func changeFloor(){
        self.floor+=1
    }
}
var myHome = Home(floor:0)
myHome.floor*/


/*protocol TelevisionBase {
    var name:(Firm:String,Model:String) { get }
    var power:Bool { get }
    func powerOnOff()
    func changeChanal(number numChanal:Int)
}*/

/*class Television{
    //Реализуйте класс "Телевизор". У него должны быть состояния:
    var name:(Firm:String,Model:String) //фирма/модель (реализовать одним полем);
    var power:Bool //включен/выключен;
    var currentChanal:Int //текущий телеканал;
    enum Chanal:Int {
        case Discovery=1,AnimalPlanet,History,Пятница,ТНТ
    }
    init(name:(Firm:String,Model:String),power:Bool,currentChanal:Int){
        self.name = name
        self.power = power
        self.currentChanal=currentChanal
    }
//У него должно быть поведение:
//показать, что сейчас по телеку
    func whatShow(){
        /*if let chanal = Chanal.init(rawValue: self.currentChanal){
        print("Вы смотрите \(chanal)")
        } else {
        print("No chanal")
        }*/
    }
    func powerOnOff(){//- Сделайте изменение состояний телевизора (на свой выбор).
        self.power = !self.power
        self.power==true ? print("Телевизор включен") : print("Телевизор выключен")
    }
    func changeChanal(number numChanal:Int)->Optional<Chanal>{  //переключение каналов
        self.currentChanal = numChanal
        if let chanal = Chanal.init(rawValue: numChanal){
        print("Вы переключились на \(chanal)")
        //return chanal
        } else {
        print("No chanal")
        }
        return Chanal.init(rawValue: self.currentChanal)
    }
}
var tv = Television(name: (Firm: "LG", Model: "OLED55C1RLA"), power: true, currentChanal: 1)
//- Вызовите метод и покажите, что сейчас по телеку.
/*tv.whatShow()
tv.currentChanal
tv.powerOnOff()
tv.name.Model
tv.power
tv.powerOnOff()
tv.whatShow()
tv.changeChanal(number: 3)
tv.currentChanal
tv.whatShow() //- Повторите вызов метода и покажите, что сейчас по телеку.*/
tv.whatShow()



/*enum Chanal:Int {
    case Discovery=1,AnimalPlanet,History,Пятница,ТНТ
}
func show(){
    return changeChanal(number: 3)
    
}
func changeChanal(number:Int)->Optional<Chanal>{
    if let chanal = Chanal.init(rawValue: number){
      print("\(chanal)")
    }
    return Chanal.init(rawValue: number)
}
let a = changeChanal(number: 3)*/
import Foundation
let timeIntervals: [TimeInterval] = [
    0.0,
    100.0,
    600.0,
    10_450.0,
    100_844.0
]
let time:TimeInterval = 60.0
type(of: time)
let formatter = DateComponentsFormatter()
let timeTrack = DateComponentsFormatter().string(from: 600)

for timeInterval in timeIntervals {
    print(formatter.string(from: timeInterval)!)
}
let formatter1 = DateComponentsFormatter()
formatter.unitsStyle = .full
formatter.includesApproximationPhrase = true
formatter.includesTimeRemainingPhrase = true
formatter.allowedUnits = [.minute]
 
// Use the configured formatter to generate the string.
let outputString = formatter1.string(from: 300.0)*/
//Closure
/*
let block = {(name:String,age:Int)->String in
    "Name \(name) , age \(age)"
}
print(block("Lada",5))

//-----
let array :[Int] = [1,2,3,4,5,6,7,8,9,10,20]
func filterArray (_ numbers:[Int],_ closure:(Int) -> Bool) -> [Int]{
    var result:[Int] = []
    for number in numbers {
        if closure(number){
            result.append(number)
        }
    }
    return result
}
func isEven(numbers:Int)->Bool{
    return numbers%2==0
}
func isModuleOfThen(numbers:Int)->Bool{
    return numbers%10==0
}
filterArray(array,isEven)
filterArray(array, isModuleOfThen)

filterArray(array,{ (numbers:Int)->Bool in
    return numbers%10==0
})
// trailing closure
filterArray(array) { number in
    number%10==0
}
print(filterArray(array){$0<=5})
//сокращенные формы записи
let calculateRefuelFlight = {
 (distance: Double, weight: Double) -> Int in

 let fullDistanceWeight = Int(weight * distance)

 // 120 - Расход топлива самолета. Взято из головы.
 return fullDistanceWeight * 120
}
let calculateRefuelFlightOmitted: (Double, Double) -> Int = {
 let fullDistanceWeight = Int($0 * $1)

 // 120 - Расход топлива самолета. Взято из головы.
 return fullDistanceWeight * 120
}

let volumeParallelepiped:(Double,Double,Double)->Double = {
    let edgeOne = $0
    let edgeTwo = $1
    let edgwThree = $2
    return edgeOne*edgeTwo*edgwThree
}
let volumePar:(Double,Double,Double)->Double = {$0*$1*$2}
volumeParallelepiped(1,2,3)
volumePar(1,2,3)
*/
/*----Лекция протоколы----*/
/*protocol ArmorProtocol :AnyObject{
    var healthPoints:Int {get set}
    func dropHealthPoint(_ pointsToDrop:Int)
    
}

extension ArmorProtocol {
    func dropHealthPoints(_ pointsToDrop: Int){
        self.healthPoints -= pointsToDrop
    }
}

struct Man{
    func dropHealthPoint(_ pointsToDrop: Int) {
       print(pointsToDrop)
    }
    
    var healthPoints = 100
    
    
}
class Woman:ArmorProtocol {
    func dropHealthPoint(_ pointsToDrop: Int) {
        print(pointsToDrop)
    }
    
    var healthPoints: Int = 100
    
    
}

class Girl: Woman {

    static var value:String = "Hello"
}

let armor = Man()
armor.healthPoints
Girl.value



protocol ViewDelegate:AnyObject  {
    func handleTap(numberOfTaps :Int)
}

class View {
    weak var delegate:ViewDelegate?
    func tap(){
        delegate?.handleTap(numberOfTaps: 10)
    }
}
class TapHandler:ViewDelegate{
    func handleTap(numberOfTaps: Int) {
        print("User tapped: \(numberOfTaps) times")
    }
}
let view = View()
let tapHandler = TapHandler()
view.delegate = tapHandler
view.tap()
tapHandler.handleTap(numberOfTaps: 20)
view.tap()


protocol OnlyViewProtocol:View {
    var size: Int {get}
}
class View1: View,OnlyViewProtocol{
    var size: Int = 10
    func changeSize (){
        self.size = 20
    }
}

typealias SomethingType = OnlyViewProtocol & ArmorProtocol

func hello (_ something:SomethingType) {}

let view1 = View1()
view1.size = 20
view1.size

//view1 is OnlyViewProtocol
let view2 = view1 as OnlyViewProtocol



protocol Armor {
    var armorPpoints:Int{get}
    var armorType:String{get}
    func wearArmor()
}
extension Armor{
    func wearArmor(){}
}
protocol Health{
    var healthPoints:Int{get}
    func dropHealthPoints()
    
}
extension Health{
    func heal(){}
}
protocol Weapon {
    var weaponType:String {get}
    func shoot()
}

class Warrior:Weapon,Health,Armor {
    var weaponType: String = ""
    
    func shoot() {
        <#code#>
    }
    
    var healthPoints: Int = 0
    
    func dropHealthPoints() {
        <#code#>
    }
    
    var armorPpoints: Int = 0
    
    var armorType: String = ""
    
    
}
class Tower:Weapon,Health{
    
}
class Robot:Weapon,Armor,Health{
    func wearArmor() {
    }
}
*/
var array = [0,1,2,3]
let arrayAdd = [5,6,7,8]
array.append(4)
print(array)
array.append(contentsOf: arrayAdd)
print(array)
let x = Int.random(in: 0...100)
