/*---Задача №1---

Для каждого принципа ООП приведите 2-3 примера из жизни.
пример 1:
Абстракция
- Люстра минимальный набор функций светит
Инкапсуляция
- мы нажимаем на кнопку вкл, как реализовано включение от нас скрыто.
Наследование
- светодиодная люстра унаследует функции обычной люстры
Полиморфизм
- функции различных люстр могут отличаться различными режимами свечения

пример 2:
Абстракция
-пылесос минимальный набор функций собирает пыль, заряжается, мешок заполняется
Инкапсуляция
-мы включаем его и он работает, как происходит процесс уборки от нас скрыто
Наследование
-робот пылесос унаследует функции обыкновенного пылесоса
Полиморфизм
-разные роботы пылесосы могут проходить комнаты по различным алгоритмам например круговыми перемещени€ми или по периметру

---Задача №2---
пример1:
Класс
-Игрушка
Объект(экземпляр)
- Кукла петрушка
Свойства объектов:
-размер
-цвет
-одежда
Методы:
-говорить
-ходить

пример2:
Класс
-Игровая приставка
Объект(экземпляр)
-Xbox360
Свойства объектов:
-объем жесткого диска
-цвет
-наличие USB портов
-год выпуска
Методы:
-включить
-открыть дисковод
-соединить с джойстиком

пример3:
Класс
-Диваны
Объект(экземпляр)
-Диван IKEA
Свойства объектов:
-количество подушек
-цвет
-размер спального места
-габариты
Методы:
-разложить
-собрать
*/

//Задача *
protocol hoover{   // абстракция
    func vacuumOn()
    func powerOn()
    func dustBug()
}
class robotHoover:hoover{   // создаем класс robotHoover и наследуем hoover
  var diameter: Float
  var runTime: Int
  //конструктор
  init (diameter:Float,runTime:Int){  //метод init инициализация класса
  self.diameter = diameter  // передаем значения в переменные
  self.runTime = runTime
  }
  private func clining(){  //процесс уборки инкапсулирован
  }
  func cliningMode(){
    print("Уборка по периметру") //режим уборки
  }
  func powerOn(){print("Питание подано")}
  func vacuumOn(){print("Пылесос включен")}
  func dustBug(){print("Отсек")}
}
class washingRobotHoover: robotHoover{ // создаем класс washingRobotHoover и наследуем robotHoover
  var waterVolume:Int
  init (diameter:Float,runTime:Int,waterVolume:Int){
    self.waterVolume = waterVolume
    super.init(diameter:diameter,runTime:runTime)  //super вызывает родительский метод init для инициализации класса
  }
  override func cliningMode(){ //полиморфизм измением режимы работы
    super.cliningMode()
    print("Влажная уборка")
  }
}
//создаем обьекты(экземпляры)
let roomba700 = robotHoover(diameter:13.9, runTime:90)
roomba700.powerOn()
let scooba300 = washingRobotHoover(diameter:12.9, runTime:100, waterVolume:237)
scooba300.powerOn()
