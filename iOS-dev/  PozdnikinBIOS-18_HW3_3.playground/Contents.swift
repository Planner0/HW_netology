import Foundation
import UIKit
/*Задача 1 (основная)
ВЫ - главный архитектор в команде разработчиков. Ваша задача - разработать программное обеспечение (ПО) для дилерских центров по продаже автомобилей. Ваша цель - создать гибкое ПО. Что это значит? Ваше ПО должно подходить для любой марки авто, должно быть расширяемым и масштабируемым в дальнейшем, чтобы ваша компания могла выпускать обновления. Задача разделена на 4 части, в каждой из них нужно самостоятельно подумать, какой тип данных передать каждому свойству для комфортной работы, а также по необходимости добавить вспомогательные методы.

Часть 1.
Для начала нужно описать машину минимальным набором параметров, используя протокол.

Алгоритм выполнения
Создайте протокол 'Car'
Добавьте в него свойства:
'model' (только для чтения): марка
'color' (только для чтения): цвет
'buildDate' (только для чтения): дата выпуска
'price' (чтение и запись): цена авто
'accessories' (чтение и запись): дополнительное оборудование (тонировка, сингнализация, спортивные диски)
'isServiced' (чтение и запись): сделана ли предпродажная подготовка. Обычно ее делают в дилерских центрах перед постановкой машины в салон.
 */

// MARK: - Protocols

protocol Car {
    var model: String {get}
    var color: UIColor {get}
    var buildDate: Date {get}
    var price: Double {get set}
    var accessories: [Accessories] {get set}
    var isServiced: Bool {get set}
}
/*
Часть 2.
По аналогии с протоколом 'Car', нужно описать дилерский центр минимальным набором свойств и методов, используя протокол.

Алгоритм выполнения
Создайте протокол 'Dealership'
Добавьте свойства:
'name' (только для чтения): название дилерского центра (назвать по марке машины для упрощения)
'showroomCapacity' (только для чтения): максимальная вместимость автосалона по количеству машин.
'stockCars' (массив, чтение и запись): машины, находящиеся на парковке склада. Представим, что парковка не имеет лимита по количеству машин.
'showroomCars' (массив, чтение и запись): машины, находящиеся в автосалоне.
'cars' (массив, чтение и запись): хранит список всех машин в наличии.
Добавьте методы:
'offerAccesories(_ :)': принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить доп. оборудование.
'presaleService(_ :)': принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку.
'addToShowroom(_ :)': также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку.
'sellCar(_ :)': также принимает машину в качестве параметра. Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка. Также, если у машины отсутсвует доп. оборудование, нужно предложить клиенту его купить. (давайте представим, что клиент всегда соглашается и покупает :) )
'orderCar()': не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т.е. добавляет машину на парковку склада.
Обратите внимание! Каждый метод должен выводить в консоль информацию о машине и выполненном действии с ней.
*/
protocol Dealership {
    var tagline: String {get set}
    var name: String {get}
    var showroomCapacity: Int {get}
    var stockCars: [Car] {get set}
    var showroomCars: [Car] {get set}
    var cars: [Car] {get set}
    func offerAccesories(_ accessories:[Accessories])
    func presaleService(_ car: Car)
    func addToShowroom(_ car: Car) throws
    func sellCar(_ car: Car)
    func orderCar(_ car: Car)
}
/*
Часть 3.
Настало время добавить классы и структуры, реализующие созданные ранее протоколы.

Алгоритм выполнения
Используя структуры, создайте несколько машин разных марок (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол 'Car'.
Используя классы, создайте пять различных дилерских центров (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол 'Dealership'. Каждому дилерскому центру добавьте машин на парковку и в автосалон (используйте те машины, которые создали ранее).
Создайте массив, положите в него созданные дилерские центры. Пройдитесь по нему циклом и выведите в консоль слоган для каждого дилеского центра (слоган можно загуглить).
Обратите внимание! Используйте конструкцию приведения типа данных для решения этой задачи.
 */
enum Accessories {
    case signaling, sportDiscs, toning, firstAidKit, extinguisher}
struct Bmw: Car {
    var model: String
    var color: UIColor
    var buildDate: Date
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
}
var bmwX5: Car = Bmw(model: "x5", color: .blue, buildDate: Date.init(timeIntervalSinceNow: -36000000), price: 5200000.5, accessories: [.signaling], isServiced: false)
var bmwX1: Car = Bmw(model: "x1", color: .green, buildDate: Date.init(timeIntervalSinceNow: -45000000), price: 8000000, accessories: [.toning], isServiced: true)
var bmwX3: Car = Bmw(model: "x3", color: .lightGray, buildDate: Date.now, price: 2000000, accessories: [], isServiced: false)

struct Honda: Car {
    var model: String
    var color: UIColor
    var buildDate: Date
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
}
var hondaCRV: Car = Honda(model: "CR-V", color: .white, buildDate: Date.init(timeIntervalSinceNow: -36000000), price: 5200000.5, accessories: [.sportDiscs,.toning], isServiced: false)

struct Audi: Car {
    var model: String
    var color: UIColor
    var buildDate: Date
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
}
var audiTT: Car = Audi(model: "TT", color: .brown, buildDate: Date.init(timeIntervalSinceNow: -36000000), price: 10200000.5, accessories: [.toning,.sportDiscs,.signaling], isServiced: true)

struct Lexus: Car {
    var model: String
    var color: UIColor
    var buildDate: Date
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
}
var lexusNX: Car = Lexus(model: "NX", color: .green, buildDate: Date.now, price: 5200000.5, accessories: [.signaling,.sportDiscs], isServiced: false)

struct Volvo: Car {
    var model: String
    var color: UIColor
    var buildDate: Date
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
}
var volvoXC90: Car = Volvo(model: "XC90", color: .purple, buildDate: Date.now, price: 5200000.5, accessories: [], isServiced: true)
var volvoXC60: Car = Volvo(model: "XC60", color: .lightGray, buildDate: Date.init(timeIntervalSinceNow: -50000000), price: 602500, accessories: [.toning], isServiced: false)
var volvoXC30: Car = Volvo(model: "XC30", color: .green, buildDate: Date.init(timeIntervalSinceNow: -36000000), price: 800000, accessories: [.sportDiscs], isServiced: false)
enum AddToShowroomError: Error {
    case isAlredyInTheShowroom
}
class BmwDealer: Dealership {
    var tagline: String = ""
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    func offerAccesories(_ accessories: [Accessories]) {
        print("Предлагаем приобрести доп. оборудование:")
        for i in accessories{
            print(i)
        }
    }
    func presaleService(_ car: Car) {
        if car.isServiced {
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            car.isServiced != car.isServiced
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        }
    }
    func addToShowroom(_ car: Car) throws {
        guard let index = self.stockCars.firstIndex(where: {$0.model == car.model}) else {
            let error = AddToShowroomError.isAlredyInTheShowroom
            throw error
        }
        stockCars.remove(at: index)
        showroomCars.append(car)
        print("Автомобиль \(car.model) перегнали с парковки в салон")
        presaleService(car)
        /*} else {
            print("Автомобиль \(car.model) отсутствует на парковке")
        }*/
    }
    func sellCar(_ car: Car) {
        if car.isServiced, car.accessories.isEmpty {
            offerAccesories([.toning, .sportDiscs, .signaling])
            print("Подписываем договор купли продажи на автомобиль \(car.model)")
            if let index = self.cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            } else {
                print("Автомобиль \(car.model) необходимо направить на предпродажную подготовку")
            }
        }
    }
    func orderCar(_ car: Car) {
        stockCars.append(car)
        cars.append(car)
        print("Заказать новую машину \(car.model) с завода")
    }
}
var bmwDealer = BmwDealer(name: "bmw", showroomCapacity: 100, stockCars: [bmwX5,bmwX3], showroomCars: [bmwX1], cars: [bmwX5,bmwX1,bmwX3])
    
class HondaDealer: Dealership {
    var tagline: String = ""
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    func offerAccesories(_ accessories: [Accessories]) {
        print("Предлагаем приобрести доп. оборудование:")
        for i in accessories{
            print(i)
        }
    }
    func presaleService(_ car: Car) {
        if car.isServiced {
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            car.isServiced != car.isServiced
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        }
    }
    func addToShowroom(_ car: Car) {
        if let index = self.stockCars.firstIndex(where: {$0.model == car.model}) {
            stockCars.remove(at: index)
            showroomCars.append(car)
            print("Автомобиль \(car.model) перегнали с парковки в салон")
            //presaleService(car)
        } else {
            print("Автомобиль \(car.model) отсутствует на парковке")
        }
    }
    func sellCar(_ car: Car) {
        if car.isServiced, car.accessories.isEmpty {
            offerAccesories([.toning, .sportDiscs, .signaling])
            print("Подписываем договор купли продажи на автомобиль \(car.model)")
            if let index = self.cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            } else {
                print("Автомобиль \(car.model) необходимо направить на предпродажную подготовку")
            }
        }
    }
    func orderCar(_ car: Car) {
        stockCars.append(car)
        cars.append(car)
        print("Заказать новую машину \(car.model) с завода")
    }
}
var hondaDealer: Dealership = HondaDealer(name: "honda", showroomCapacity: 10, stockCars: [hondaCRV], showroomCars: [hondaCRV], cars: [hondaCRV])

class AudiDealer: Dealership {
    var tagline: String = ""
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    func offerAccesories(_ accessories: [Accessories]) {
        print("Предлагаем приобрести доп. оборудование:")
        for i in accessories{
            print(i)
        }
    }
    func presaleService(_ car: Car) {
        if car.isServiced {
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            car.isServiced != car.isServiced
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        }
    }
    func addToShowroom(_ car: Car) {
        if let index = self.stockCars.firstIndex(where: {$0.model == car.model}) {
            stockCars.remove(at: index)
            showroomCars.append(car)
            print("Автомобиль \(car.model) перегнали с парковки в салон")
            //presaleService(car)
        } else {
            print("Автомобиль \(car.model) отсутствует на парковке")
        }
    }
    func sellCar(_ car: Car) {
        if car.isServiced, car.accessories.isEmpty {
            offerAccesories([.toning, .sportDiscs, .signaling])
            print("Подписываем договор купли продажи на автомобиль \(car.model)")
            if let index = self.cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            } else {
                print("Автомобиль \(car.model) необходимо направить на предпродажную подготовку")
            }
        }
    }
    func orderCar(_ car: Car) {
        stockCars.append(car)
        cars.append(car)
        print("Заказать новую машину \(car.model) с завода")
    }
}
var audiDealer = AudiDealer(name: "audi", showroomCapacity: 10, stockCars: [audiTT], showroomCars: [], cars: [audiTT])

class LexusDealer: Dealership {
    var tagline: String = ""
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    func offerAccesories(_ accessories: [Accessories]) {
        print("Предлагаем приобрести доп. оборудование:")
        for i in accessories{
            print(i)
        }
    }
    func presaleService(_ car: Car) {
        if car.isServiced {
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            car.isServiced != car.isServiced
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        }
    }
    func addToShowroom(_ car: Car) {
        if let index = self.stockCars.firstIndex(where: {$0.model == car.model}) {
            stockCars.remove(at: index)
            showroomCars.append(car)
            print("Автомобиль \(car.model) перегнали с парковки в салон")
            //presaleService(car)
        } else {
            print("Автомобиль \(car.model) отсутствует на парковке")
        }
    }
    func sellCar(_ car: Car) {
        if car.isServiced, car.accessories.isEmpty {
            offerAccesories([.toning, .sportDiscs, .signaling])
            print("Подписываем договор купли продажи на автомобиль \(car.model)")
            if let index = self.cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            } else {
                print("Автомобиль \(car.model) необходимо направить на предпродажную подготовку")
            }
        }
    }
    func orderCar(_ car: Car) {
        stockCars.append(car)
        cars.append(car)
        print("Заказать новую машину \(car.model) с завода")
    }
}
var lexusDealer: Dealership = LexusDealer(name: "lexus", showroomCapacity: 10, stockCars: [lexusNX], showroomCars: [lexusNX], cars: [lexusNX])

class VolvoDealer: Dealership {
    var tagline: String = ""
    var name: String
    var showroomCapacity: Int
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car]
    init(name: String, showroomCapacity: Int, stockCars: [Car], showroomCars: [Car], cars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }
    func offerAccesories(_ accessories: [Accessories]) {
        print("Предлагаем приобрести доп. оборудование:")
        for i in accessories{
            print(i)
        }
    }
    func presaleService(_ car: Car) {
        if car.isServiced {
            print("Автомобиль \(car.model) прошел предпродажную подготовку")
        } else {
            car.isServiced != car.isServiced
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        }
    }
    func addToShowroom(_ car: Car) {
        if let index = self.stockCars.firstIndex(where: {$0.model == car.model}) {
            stockCars.remove(at: index)
            showroomCars.append(car)
            print("Автомобиль \(car.model) перегнали с парковки в салон")
            //presaleService(car)
        } else {
            print("Автомобиль \(car.model) отсутствует на парковке")
        }
    }
    func sellCar(_ car: Car) {
        if car.isServiced, car.accessories.isEmpty {
            offerAccesories([.toning, .sportDiscs, .signaling])
            print("Подписываем договор купли продажи на автомобиль \(car.model)")
            if let index = self.cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            } else {
                print("Автомобиль \(car.model) необходимо направить на предпродажную подготовку")
            }
        }
    }
    func orderCar(_ car: Car) {
        stockCars.append(car)
        cars.append(car)
        print("Заказать новую машину \(car.model) с завода")
    }
}
var volvoDealer = VolvoDealer(name: "volvo", showroomCapacity: 10, stockCars: [volvoXC90, volvoXC60], showroomCars: [volvoXC30], cars: [volvoXC90, volvoXC60, volvoXC30])
volvoDealer.offerAccesories([.signaling])
volvoDealer.presaleService(volvoXC90)
volvoDealer.addToShowroom(volvoXC90)
//volvoDealer.sellCar(volvoXC90)

volvoDealer.tagline = "для Жизни"
lexusDealer.tagline = "Неудержимое стремление к совершенству"
audiDealer.tagline = "Продвижение через превосходство"
hondaDealer.tagline = "Сначало человек, потом машина"
bmwDealer.tagline = "С удовольствием за рулем"

var arrayDealer: [Dealership] = [bmwDealer, hondaDealer, audiDealer, lexusDealer, volvoDealer]

for dealer in arrayDealer {
    switch dealer {
    case let bmwDealerTag as BmwDealer: print("Слоган \(bmwDealerTag.name): \(bmwDealerTag.tagline)")
    case let volvoDealerTag as VolvoDealer: print("Слоган \(volvoDealerTag.name): \(volvoDealerTag.tagline)")
    case let audiDealerTag as AudiDealer: print("Слоган \(audiDealerTag.name): \(audiDealerTag.tagline)")
    case let hondaDealerTag as HondaDealer: print("Слоган \(hondaDealerTag.name): \(hondaDealerTag.tagline)")
    case let lexusDealerTag as LexusDealer: print("Слоган \(lexusDealerTag.name): \(lexusDealerTag.tagline)")
    default: break
    }
}
/*for dealer in arrayDealer {
    print(dealer.tagline)
}*/

/*
Часть 4.
Работа с расширениями. Нам нужно добавить спецпредложение для "прошлогодних" машин.

Алгоритм выполнения
Создайте протокол SpecialOffer.
Добавьте методы:
'addEmergencyPack()': не принимает никаких параметров. Метод добавляет аптечку и огнетушитель к доп. оборудованию машины.
'makeSpecialOffer()': не принимает никаких параметров. Метод проверяет дату выпуска авто, если год выпуска машины меньше текущего, нужно сделать скидку 15%, а также добавить аптеку и огнетушитель.
Используя расширение, реализуйте протокол 'SpecialOffer' для любых трех дилерских центров.
Проверьте все машины в дилерском центре (склад + автосалон), возможно они нуждаются в специальном предложении. Если есть машины со скидкой на складе, нужно перегнать их в автосалон.
*/
protocol SpecialOffer {
    func addEmargencyPack()
    func makeSpecialOffer() throws
}
/*Задача №1
 
 Алгоритм выполнения

 1 Внесите изменения в метод 'makeSpecialOffer()' таким образом, чтобы он возвращал ошибку, если машина не соответствует требованиям акции.
 2 В случае, если нет ошибки, сделайте для этой машины специальное предложение.
 3 Проверьте текущий список машин, чтобы при проверке генерировались ошибки. При необходимости, внесите изменения.
 4 Обработайте ошибки.
 
 Задача №2

 Алгоритм выполнения

 1 Перейдите к той части кода, где вы выполняли следующее задание: "Проверьте все машины в дилерском центре (склад + автосалон), возможно они нуждаются в специальном предложении. Если есть машины со скидкой на складе, нужно перегнать их в автосалон."
 2 Аналогично первой задаче, внесите изменения в код таким образом, чтобы осуществлялся возврат ошибки в том случае, если машина со скидкой уже находится в автосалоне. В том случае, если ошибки нет, нужно перегнать машину в автосалон.
 3 Проверьте текущий список машин, чтобы при проверке генерировались ошибки. При необходимости, внесите изменения.
 4 Обработайте ошибки.*/

enum MakeSpecialOfferError: Error {
    case doesNotMatch
}
extension BmwDealer: SpecialOffer {
    func addEmargencyPack() {
        var carInCars: Car
        for car in cars{
            carInCars = car
            carInCars.accessories.append(.firstAidKit)
            carInCars.accessories.append(.extinguisher)
            cars.append(carInCars)
            if let index = cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            }
        }
        var carInStockCars: Car
        for car in stockCars{
            carInStockCars = car
            carInStockCars.accessories.append(.firstAidKit)
            carInStockCars.accessories.append(.extinguisher)
            stockCars.append(carInStockCars)
            if let index = stockCars.firstIndex(where: {$0.model == car.model}) {
                stockCars.remove(at: index)
            }
        }
        var carInShowroomCars: Car
        for car in showroomCars {
            carInShowroomCars = car
            carInShowroomCars.accessories.append(.firstAidKit)
            carInShowroomCars.accessories.append(.extinguisher)
            showroomCars.append(carInShowroomCars)
            if let index = showroomCars.firstIndex(where: {$0.model == car.model}) {
                showroomCars.remove(at: index)
            }
        }
    }
    func makeSpecialOffer() throws {
        var carInCarsSpecialOffer: Car
        for car in cars {
            carInCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInCarsSpecialOffer.price *= 0.85
                carInCarsSpecialOffer.accessories.append(.firstAidKit)
                carInCarsSpecialOffer.accessories.append(.extinguisher)
                cars.append(carInCarsSpecialOffer)
                if let index = cars.firstIndex(where: {$0.model == car.model}) {
                    cars.remove(at: index)
                }
            }
        }
        var carInShowroomCarsSpecialOffer: Car
        for car in showroomCars {
            carInShowroomCarsSpecialOffer = car
            guard Calendar.current.component(.year, from: carInShowroomCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) else {
                let error = MakeSpecialOfferError.doesNotMatch
                throw error
            }
            carInShowroomCarsSpecialOffer.price *= 0.85
            carInShowroomCarsSpecialOffer.accessories.append(.firstAidKit)
            carInShowroomCarsSpecialOffer.accessories.append(.extinguisher)
            showroomCars.append(carInShowroomCarsSpecialOffer)
            if let index = showroomCars.firstIndex(where: {$0.model == car.model}) {
                showroomCars.remove(at: index)
            }
            print("Для машины \(carInShowroomCarsSpecialOffer.model) действует специальное предложение - скидка 15%, стоимость с учетом скидки \(String(format: "%.2f", carInShowroomCarsSpecialOffer.price)) руб.")
        }
        var carInStockCarsSpecialOffer: Car
        for car in stockCars{
            carInStockCarsSpecialOffer = car
            guard Calendar.current.component(.year, from: carInStockCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) else {
                let error = MakeSpecialOfferError.doesNotMatch
                throw error
            }
            carInStockCarsSpecialOffer.price *= 0.85
            carInStockCarsSpecialOffer.accessories.append(.firstAidKit)
            carInStockCarsSpecialOffer.accessories.append(.extinguisher)
            stockCars.append(carInStockCarsSpecialOffer)
            if let index = stockCars.firstIndex(where: {$0.model == car.model}) {
                stockCars.remove(at: index)
            }
            print("Для машины \(carInStockCarsSpecialOffer.model) действует специальное предложение - скидка 15%, стоимость с учетом скидки \(String(format: "%.2f", carInStockCarsSpecialOffer.price)) руб.")
            do {
                try addToShowroom(carInStockCarsSpecialOffer)
            } catch AddToShowroomError.isAlredyInTheShowroom {
                print("Машина находится в шоуруме")
            } catch {
                print("Другая ошибка")
            }
            
        }
    }
}

do {
     try bmwDealer.makeSpecialOffer()
} catch MakeSpecialOfferError.doesNotMatch {
     print("Для машины специальное предложение не действует")
} catch {
    print("Другая ошибка")
}
do {
    try bmwDealer.addToShowroom(bmwX5)
} catch AddToShowroomError.isAlredyInTheShowroom {
    print("Машина находится в шоуруме")
} catch {
    print("Другая ошибка")
}
/*extension VolvoDealer: SpecialOffer {
    func addEmargencyPack() {
        var carInCars: Car
        for car in cars{
            carInCars = car
            carInCars.accessories.append(.firstAidKit)
            carInCars.accessories.append(.extinguisher)
            cars.append(carInCars)
            if let index = cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            }
        }
        var carInStockCars: Car
        for car in stockCars{
            carInStockCars = car
            carInStockCars.accessories.append(.firstAidKit)
            carInStockCars.accessories.append(.extinguisher)
            stockCars.append(carInStockCars)
            if let index = stockCars.firstIndex(where: {$0.model == car.model}) {
                stockCars.remove(at: index)
            }
        }
        var carInShowroomCars: Car
        for car in showroomCars{
            carInShowroomCars = car
            carInShowroomCars.accessories.append(.firstAidKit)
            carInShowroomCars.accessories.append(.extinguisher)
            showroomCars.append(carInShowroomCars)
            if let index = showroomCars.firstIndex(where: {$0.model == car.model}) {
                showroomCars.remove(at: index)
            }
        }
    }
    func makeSpecialOffer() {
        var carInCarsSpecialOffer: Car
        for car in cars {
            carInCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInCarsSpecialOffer.price *= 0.85
                carInCarsSpecialOffer.accessories.append(.firstAidKit)
                carInCarsSpecialOffer.accessories.append(.extinguisher)
                cars.append(carInCarsSpecialOffer)
                if let index = cars.firstIndex(where: {$0.model == car.model}) {
                    cars.remove(at: index)
                }
            }
        }
        
        var carInShowroomCarsSpecialOffer: Car
        for car in showroomCars {
            carInShowroomCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInShowroomCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInShowroomCarsSpecialOffer.price *= 0.85
                carInShowroomCarsSpecialOffer.accessories.append(.firstAidKit)
                carInShowroomCarsSpecialOffer.accessories.append(.extinguisher)
                showroomCars.append(carInShowroomCarsSpecialOffer)
                if let index = showroomCars.firstIndex(where: {$0.model == car.model}) {
                    showroomCars.remove(at: index)
                }
                print("Для машины \(carInShowroomCarsSpecialOffer.model) действует специальное предложение - скидка 15%, стоимость с учетом скидки \(String(format: "%.2f", carInShowroomCarsSpecialOffer.price)) руб.")
            } else {
                print("Для машины \(carInShowroomCarsSpecialOffer.model) специальное предложение не действует")
            }
        }
        var carInStockCarsSpecialOffer: Car
        for car in stockCars{
            carInStockCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInStockCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInStockCarsSpecialOffer.price *= 0.85
                carInStockCarsSpecialOffer.accessories.append(.firstAidKit)
                carInStockCarsSpecialOffer.accessories.append(.extinguisher)
                stockCars.append(carInStockCarsSpecialOffer)
                if let index = stockCars.firstIndex(where: {$0.model == car.model}) {
                    stockCars.remove(at: index)
                }
                print("Для машины \(carInStockCarsSpecialOffer.model) действует специальное предложение - скидка 15%, стоимость с учетом скидки \(String(format: "%.2f", carInStockCarsSpecialOffer.price)) руб.")
                addToShowroom(carInStockCarsSpecialOffer)
            } else {
                print("Для машины \(carInStockCarsSpecialOffer.model) специальное предложение не действует")
            }
        }
    }
}

volvoDealer.makeSpecialOffer()

extension AudiDealer: SpecialOffer {
    func addEmargencyPack() {
        var carInCars: Car
        for car in cars{
            carInCars = car
            carInCars.accessories.append(.firstAidKit)
            carInCars.accessories.append(.extinguisher)
            cars.append(carInCars)
            if let index = cars.firstIndex(where: {$0.model == car.model}) {
                cars.remove(at: index)
            }
        }
        var carInStockCars: Car
        for car in stockCars{
            carInStockCars = car
            carInStockCars.accessories.append(.firstAidKit)
            carInStockCars.accessories.append(.extinguisher)
            stockCars.append(carInStockCars)
            if let index = stockCars.firstIndex(where: {$0.model == car.model}) {
                stockCars.remove(at: index)
            }
        }
        var carInShowroomCars: Car
        for car in showroomCars{
            carInShowroomCars = car
            carInShowroomCars.accessories.append(.firstAidKit)
            carInShowroomCars.accessories.append(.extinguisher)
            showroomCars.append(carInShowroomCars)
            if let index = showroomCars.firstIndex(where: {$0.model == car.model}) {
                showroomCars.remove(at: index)
            }
        }
    }
    func makeSpecialOffer() {
        var carInCarsSpecialOffer: Car
        for car in cars {
            carInCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInCarsSpecialOffer.price *= 0.85
                carInCarsSpecialOffer.accessories.append(.firstAidKit)
                carInCarsSpecialOffer.accessories.append(.extinguisher)
                cars.append(carInCarsSpecialOffer)
                if let index = cars.firstIndex(where: {$0.model == car.model}) {
                    cars.remove(at: index)
                }
            }
        }
        
        var carInShowroomCarsSpecialOffer: Car
        for car in showroomCars {
            carInShowroomCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInShowroomCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInShowroomCarsSpecialOffer.price *= 0.85
                carInShowroomCarsSpecialOffer.accessories.append(.firstAidKit)
                carInShowroomCarsSpecialOffer.accessories.append(.extinguisher)
                showroomCars.append(carInShowroomCarsSpecialOffer)
                if let index = showroomCars.firstIndex(where: {$0.model == car.model}) {
                    showroomCars.remove(at: index)
                }
                print("Для машины \(carInShowroomCarsSpecialOffer.model) действует специальное предложение - скидка 15%, стоимость с учетом скидки \(String(format: "%.2f", carInShowroomCarsSpecialOffer.price)) руб.")
            } else {
                print("Для машины \(carInShowroomCarsSpecialOffer.model) специальное предложение не действует")
            }
        }
        var carInStockCarsSpecialOffer: Car
        for car in stockCars{
            carInStockCarsSpecialOffer = car
            if Calendar.current.component(.year, from: carInStockCarsSpecialOffer.buildDate) < Calendar.current.component(.year, from: Date()) {
                carInStockCarsSpecialOffer.price *= 0.85
                carInStockCarsSpecialOffer.accessories.append(.firstAidKit)
                carInStockCarsSpecialOffer.accessories.append(.extinguisher)
                stockCars.append(carInStockCarsSpecialOffer)
                if let index = stockCars.firstIndex(where: {$0.model == car.model}) {
                    stockCars.remove(at: index)
                }
                print("Для машины \(carInStockCarsSpecialOffer.model) действует специальное предложение - скидка 15%, стоимость с учетом скидки \(String(format: "%.2f", carInStockCarsSpecialOffer.price)) руб.")
                addToShowroom(carInStockCarsSpecialOffer)
            } else {
                print("Для машины \(carInStockCarsSpecialOffer.model) специальное предложение не действует")
            }
        }
    }
}

audiDealer.makeSpecialOffer()
*/




