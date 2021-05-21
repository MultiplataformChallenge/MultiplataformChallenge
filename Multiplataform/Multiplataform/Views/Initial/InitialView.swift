//
//  InitialView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<exercises.count) { item in
                #if os(watchOS)
                ExerciseCellWatch(cardIndex: item, exercise: exercises[item])
                    .modifier(BackgroundModifier())
                #else
                ExerciseCellIOS(cardIndex: item, exercise: exercises[item])
                #endif
            }
        }
        .modifier(BackgroundModifier())
    }
    
}

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.init(.black).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

// mocked data
var exercises = [
    Exercise(identifier: UUID(), name: "Alongamento Completo", timeExercise: 3, repeatExercise: 1, category: .head, image: Image("a")),
    Exercise(identifier: UUID(), name: "Alongamento Cabeça", timeExercise: 3, repeatExercise: 1, category: .head, image: Image("a")),
    Exercise(identifier: UUID(), name: "Alongamento Braço", timeExercise: 3, repeatExercise: 1, category: .head, image: Image("a"))
]

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}

enum ExerciseCategories {
    case head
    case leg
    case arm
}

struct Exercise {
    var identifier: UUID
    var name: String
    var timeExercise: Int
    var repeatExercise: Int
    var category: ExerciseCategories
    var image: Image
}
