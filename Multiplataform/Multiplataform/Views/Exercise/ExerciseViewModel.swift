//
//  ExerciseViewModel.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import Combine
import Foundation

final class ExerciseViewModel: ObservableObject, Identifiable {
    enum TimerState {
        case exercise
        case pause
        case rest
        case end
    }
    
    // Set Exercises
    var index: Int
    var currentExercises: [ExerciseModel]

    // Timer Ajust
    @Published var timerState: TimerState
    @Published var repetition: Int
    @Published var currentTime: Int
    
    init() {
        self.index = 0
        self.currentExercises = exercises
        self.timerState = .exercise
        self.repetition = currentExercises[index].timesOfRepetition
        self.currentTime = currentExercises[index].duration
//        self.numberOfExercises = exercises.count
    }

}




//    let exercise = Exercise(name: "Alongamento Pernas", numberOfRepetitions: 2, timePerRepetition: 20, timeBetweenRepetition: 5, timeOfRest: 15)
//    let exercise2 = Exercise(name: "Alongamento Panturrilhas", numberOfRepetitions: 1, timePerRepetition: 20, timeBetweenRepetition: 5, timeOfRest: 15)
//    let numberOfExercises: Int
