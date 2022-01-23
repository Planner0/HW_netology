import Foundation
class Task {
    enum TaskName {
        case cleaning,shopping,bill
    }
    var taskName:TaskName
    var time:Date
    enum Executor {
        case man,woman
    }
    var executor:Executor
    init(taskName:TaskName,executor:Executor,time:Date){
        self.taskName = taskName
        self.time = time
        self.executor = executor
    }
}

let cleaningTheCat = Task(taskName: .cleaning, executor: .man, time: .now)
cleaningTheCat.time
