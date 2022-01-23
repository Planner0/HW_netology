/*
 Задача 1
 Вы продолжаете разрабатывать библиотеку аудио треков. Сейчас будем работать над исполнителями треков.

 Алгоритм выполнения
 Создайте суперкласс артист;
 Определите в нем общие для артиста свойства (имя, страна, жанр);
 Определите общие методы (написать трек и исполнить трек);
 В реализацию метода "написать трек" добавьте вывод в консоль "Я (имя артиста) написал трек (название трека)";
 В реализацию метода "исполнить трек" добавьте вывод в консоль "Я (имя артиста) исполнил трек (название трека)";
 Создайте 3 сабкласса любых артистов и переопределите в них свойства суперкласса класса.
 */
 print("---задача 1---")
import Foundation
enum Genre{
    case rock,pop,soul,jazz,hipHop,metal,classic
}
enum Country{
    case russia,usa,ukrane,finland
}
class Track {
    var nameTrack:String
    var autor:Artist
    var timeSeconds:TimeInterval
    lazy var timeTrack = {DateComponentsFormatter().string(from: timeSeconds)}()
    lazy var trackInfo = {
        if let a = self.timeTrack {
            print("Композиция \(self.nameTrack) автор \(self.autor) длительность \(a))")
        }
    }
    var countryTrack:Country
    init(nameTrack:String,autor:Artist,timeSeconds:TimeInterval,countryTrack:Country){
        self.nameTrack=nameTrack
        self.timeSeconds=timeSeconds
        self.countryTrack=countryTrack
        self.autor = autor
    }
}
class Artist{
    var name:String
    weak var track:Track?
    var genre:Genre
    var countryArtist:Country
    init(name: String, countryArtist: Country, genre:Genre){
        self.genre = genre
        self.countryArtist = countryArtist
        self.name = name
    }
    func writeTrack(){
        if let a = track{
            print("\(self.name) написал трек \(a.nameTrack)")
        }
    }
    func performTrack(){
        if let a = track{
            print("\(self.name) исполнил трек \(a.nameTrack)")
        }
    }
}
class Solo:Artist{
    override var name: String{
        get{
            return super.name
        }
        set{
            print("\(newValue) - новый исполнитель")
        }
    }
    override func writeTrack() {
        super.writeTrack()
        if let a = track{
            print("Авторская версия \(a.nameTrack)")
        }
    }
}
class Duet:Artist{
    
    override var countryArtist: Country {
        get{
            return super.countryArtist
        }
        set{
            print("\(newValue) - cтрана")
        }    }
}
class Band:Artist{
    
    override var genre:Genre{
        get{
            return super.genre
        }
        set{
            print("\(newValue) - новый жанр")
        }    }
}

var solo = Solo (name: "Jon Bon Jovi", countryArtist: .usa, genre: .rock)
var track = Track(nameTrack: "its my life", autor: solo, timeSeconds: 150, countryTrack: .usa)
solo.track
solo.track = track
solo.writeTrack()
solo.name = "Jon Bon Jovi"


/*
 Задача 2
 Создание списка артистов.
 
 Алгоритм выполнения
 Доработайте существующих артистов так, чтобы они имели уникальные для каждого из них свойства и методы.
 Защитите этих артистов от редактирования в будущем.
 
 */
print("---задача 2---")
extension Solo{
    final var birthday: Date!  {
        let calendar = Calendar.current
        let dateBirthday = DateComponents(calendar: calendar,  year: 1985, month: 9, day: 15)
        return calendar.date(from: dateBirthday)
    }
    final func age()->Int{
        let birthdayYear = Calendar.current.component(.year, from: birthday)
        let currentYear = Calendar.current.component(.year, from: Date())
        return currentYear-birthdayYear
    }
}
solo.birthday
solo.age()

extension Duet {
    final var firtsSingerCountry:Country {return self.countryArtist}
    final var secondSingerCountry:Country {return self.countryArtist}
    final func listSingerCountry ()->[Country]{
        var a = [Country]()
        a.append(firtsSingerCountry)
        a.append(secondSingerCountry)
        return a
    }
}
let duet = Duet(name: "Modern Talking", countryArtist: .usa, genre: .pop)
duet.secondSingerCountry
duet.listSingerCountry()

extension Band {
    final var musicalInstrument:[String:[String]] {return ["instrument": ["guitar","bass","drums"]]}
    final func listInstrument (){
        if let a = musicalInstrument["instrument"]{
            for i in  a {
                print(i)
            }
        }
    }
}
let band = Band(name: "Metallica", countryArtist: .usa, genre: .rock)
band.musicalInstrument
band.listInstrument()
/*
 Задача 3 * (задача со звездочкой):
 Создайте пустой массив, чтобы потом добавить в него ваших артистов;
 Добавьте созданных ранее артистов в массив;
 Напишите отчет о том, что вы поняли/в чем разобрались, выполняя это задание;
 Дайте оценку своему пониманию данной темы.
 Данное задание поможет вам лучше понять эту тему. В процессе написания отчета вы выявите слабые и сильные места в изучении данной темы, закроете пробелы или у вас появятся новые вопросы. При возникновении вопросов можете писать в чат группы, либо в лс преподавателю в Slack.
 */
print("---задача 3---")
var arrayArtist:[Artist]=[]
arrayArtist.append(solo)
arrayArtist.append(duet)
arrayArtist.append(band)
for i in arrayArtist{
    print(i.name)
}
/* Отчет по теме наследование: что понял
 - наследование необходимо чтобы заимствовать свойства и методы из super class в его subclass, а не дублировать их
 - наследование возможно только с reference type (class)
 - переопределять свойства в subclass можно только если они не хранимые, добавив геттер,сеттер или наблюдатели.
 - переопределять методы в subclass желательно расширяя их функциональность (principle Liskov)
 - инициализаторы subclass могут наследовать инициализаторы superclass или создать свой инициализатор
 - final необходим чтобы закрыть возможность переопределения функции и свойств класса или запрета наследования от класса
 Оценка пониманию: базово-поверхностно ясно, но еще закреплять и закреплять, чтобы прямо осознание пришло и как и когда использовать в конкретных задачах "живых" приложениях. 
 */

