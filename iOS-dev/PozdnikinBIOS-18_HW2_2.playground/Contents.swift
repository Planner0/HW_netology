/*
 Задача 1
 Вы разрабатываете библиотеку аудиотреков. Вам необходимо реализовать одну из категорий музыки, наполненную треками.

 Алгоритм выполнения
 -Создайте объект трек.
 -Определите в нем свойства имя, исполнитель, длительность и страна.
 -Создайте класс категория.
 -Объявите в нем свойства название категории, список треков и количество треков в списке (экспериментируйте с "ленивыми" и вычисляемыми свойствами).
 -Определите методы добавления и удаления треков в эту категорию.*/

 print("---задача 1---")
import Foundation
class Track {
     var nameTrack:String
     var autorTrack:String
     var timeSeconds:TimeInterval
     lazy var timeTrack = {DateComponentsFormatter().string(from: timeSeconds)}()
     lazy var trackInfo = {return "Композиция \(nameTrack) автор \(autorTrack) длительность \(timeTrack!)"}()
     var countryTrack:String
    init(nameTrack:String,autorTrack:String,timeSeconds:TimeInterval,countryTrack:String){
        self.nameTrack=nameTrack
        self.autorTrack=autorTrack
        self.timeSeconds=timeSeconds
        self.countryTrack=countryTrack
    }
     }
enum musicCategory {
    case Rock,Pop,Soul,Jazz,HipHop,Metal,Classic
}
class Category{
    var nameCategory:musicCategory
    var trackList:[Track]
    var trackCount:Int {
        self.trackList.count
    }
    init(nameCategory:musicCategory,trackList:[Track]){
        self.nameCategory = nameCategory
        self.trackList = trackList
    }
    func appendTrack (track:Track){
        trackList.append(track)
    }
    func removeTrack(track: Track) {
        trackList = trackList.filter { $0 !== track }
    }
    /* func removeTrack (track:Track){
      //  if let index = trackList.firstIndex(of: Track) {
     //       trackList.remove(at: index)
        }*/
}

let newCategory = musicCategory.Rock
newCategory
var trackOne = Track(nameTrack: "The Unforgiven", autorTrack: "Metallica", timeSeconds: 150, countryTrack: "USA")
var trackTwo = Track(nameTrack: "Stan", autorTrack: "Eminem", timeSeconds: 100, countryTrack: "USA")
trackOne.timeTrack
print(trackOne.trackInfo)
var categoryOne = Category(nameCategory:newCategory, trackList: [trackOne])
categoryOne.nameCategory = .HipHop
categoryOne.trackCount
categoryOne.appendTrack(track: trackOne)
categoryOne.appendTrack(track: trackTwo)
categoryOne.trackList
categoryOne.trackCount
categoryOne.removeTrack(track: trackOne)
categoryOne.trackCount
categoryOne.trackList[0].timeTrack

 /*Задача 2
 Доработайте свою библиотеку так, чтобы в ней было несколько категорий.
 Алгоритм выполнения
 Создайте класс библиотеки. Этот класс будет аналогичен классу категории, только хранить он должен список категорий.
*/
print("---задача 2---")
class MusicLibrary {
    var categoryList:[Category]
    var categoryCount:Int {
        self.categoryList.count
    }
    //var
    init(categoryList:[Category]){
        self.categoryList = categoryList
    }
    func exchangeTrack (categoryFirst:Category,categorySecond:Category,trackFirst:Track,trackSecond:Track){
        categoryFirst.appendTrack(track: trackFirst)
        categoryFirst.removeTrack(track: trackSecond)
        categorySecond.appendTrack(track: trackSecond)
        categorySecond.removeTrack(track: trackFirst)
        print("Категории обменялись треками")
    }
    func appendCategory(category:Category){
        categoryList.append(category)
    }
}

let appleMusic = MusicLibrary(categoryList: [categoryOne,categoryOne])
appleMusic.categoryList
appleMusic.categoryCount
appleMusic.categoryList[0].nameCategory
print(appleMusic.categoryList[0].trackList[0].trackInfo)

/* Задача 3 * (задача со звездочкой):
 Преобразуйте классы так, чтобы в пределах вашей библиотеки можно было обмениваться треками между категориями. */
print("---задача 3---")

var track1 = Track(nameTrack: "Let It Snow!", autorTrack: "Frank Sinatra", timeSeconds: 300, countryTrack: "USA")
var track2 = Track(nameTrack: "The Show Must Go On", autorTrack: "Queen", timeSeconds: 200, countryTrack: "United Kingdom")
var category1 = Category(nameCategory: .Rock, trackList: [track2])
var category2 = Category(nameCategory: .Classic, trackList: [track1])
category1.trackList
category2.trackList
appleMusic.exchangeTrack(categoryFirst: category1, categorySecond: category2, trackFirst: track1, trackSecond: track2)
category1.trackList
category2.trackList
