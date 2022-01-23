/*Задача 1
Представьте себя инженером проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты. Вам поступила задача создать устройство для просмотра эфира в домашних условиях "Телевизор в каждую семью".

Вам нужно реализовать перечисление "Телевизионный канал" с 5-7 каналами.

Алгоритм выполнения */
print("---задача 1---")

class Television {
    var name:(Firm:String,Model:String)
    var isPower:Bool
    var currentChanal:Chanal
    enum Chanal:Int {
        case discovery=1,animalPlanet,history,mtv,aone
    }
    init(name:(Firm:String,Model:String),inPower:Bool,currentChanal:Chanal){
        self.name = name
        self.isPower = inPower
        self.currentChanal=currentChanal
    }
    func whatShow(){
        if isPower{
            print("Вы смотрите \(self.currentChanal)")
        } else {
            print("Телевизор выключен")
        }
    }
    func powerOnOff(){
        self.isPower = !self.isPower
        self.isPower==true ? print("Телевизор включен") : print("Телевизор выключен")
    }
}
var tv = Television(name: (Firm: "LG", Model: "OLED55C1RLA"), inPower: true, currentChanal: .discovery)
tv.whatShow()
tv.currentChanal
tv.powerOnOff()
tv.name.Model
tv.isPower
tv.powerOnOff()
tv.whatShow()
tv.currentChanal
tv.whatShow()

/*Задача 2
 Время идет, рынок и потребители развиваются, и ваша компания набирает ритм. Поступают все новые и новые требования к эволюции устройств. Перед вами снова инженерная задача — обеспечить пользователей практичным устройством.

 Алгоритм выполнения
 -Создайте новый класс Телевизор (с другим названием класса), который будет уметь все, что и предыдущий.

 -Реализуйте структуру настроек:

 громкость от 0 до 1 (подумайте, какой тип использовать); показывать цветом или черно-белым (подумайте, какой тип данных лучше всего использовать).

 -Интегрируйте Настройки в новый класс Телевизор.

 Вызовите метод и покажите, что сейчас идет по телевизору, учитывая настройки.*/
print("---задача 2---")
class TelevisionNextGen:Television{
    var volume:Double = 0 {
        didSet{
            if self.volume < 0{
                self.volume = 0
                print("Mute")
            } else if self.volume > 1{
                self.volume = 1
                print("Достигнут предел громкости")
            }
        }
    }
    var color:Bool = false
    func changeVolumeUP(){
        self.volume += 0.1
        print("Уровень громкости установлен на \(self.volume)")
    }
    func changeVolumeDown(){
        self.volume -= 0.1
        print("Уровень громкости установлен на \(self.volume)")
    }
    func changeColor(){
        self.color = !self.color
        self.color==true ? print("Цветной режим") : print("Черно-белый режим")
    }
}
let tvNextGen = TelevisionNextGen(name: (Firm: "Sumsung", Model: "3000"), inPower: true, currentChanal:.aone)
tvNextGen.volume
tvNextGen.color
tvNextGen.changeVolumeDown()
tvNextGen.changeVolumeUP()
tvNextGen.changeVolumeDown()
tvNextGen.changeColor()
tvNextGen.changeColor()
tvNextGen.whatShow()
print("---задача 3*---")
/*Задача 3 * (задача со звездочкой):
 Порог новой эры пройден. Теперь не только есть радиоволна, но и видеомагнитофоны. Эту технику подключают проводами к телевизору и смотрят в записи свои любимые фильмы. Вам, как ведущему инженеру, срочно нужно адаптировать продукт вашей компании, потому как спрос на устаревший вариант резко пошел вниз.

 Алгоритм выполнения
 -Создайте перечисление со связанными значениями с двумя кейсами: телеканал и подключение по входящему видео порту;
 -Интегрируйте эту опцию в Телевизор.
 -Вызовите метод и покажите, что сейчас по телевизору.*/
extension Television {
    enum Input{
        case video(FilmVHS:String)
        case tv(Chanal:Chanal)
    }
    func currentInput(input:Input){
        switch input{
        case .video(FilmVHS: let FilmVHS):
            print("Вы смотрите \(FilmVHS)")
        case .tv(Chanal: let Chanal):
            self.currentChanal = Chanal
            whatShow()
        }
    }
}
var tvVHS = Television(name: (Firm: "Akai", Model: "SuperVHS"), inPower: true, currentChanal: .animalPlanet)
tvVHS.currentInput(input:.video(FilmVHS: "Рембо"))
tvVHS.currentInput(input: .tv(Chanal: .history))
