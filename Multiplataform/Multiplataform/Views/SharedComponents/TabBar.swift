//
//  TabBar.swift
//  Multiplataform
//
//  Created by Jhennyfer Rodrigues de Oliveira on 26/05/21.
//

import SwiftUI

struct TabBar: View {
    @Binding var rootIsActive: Bool
    var body: some View {
        TabView {
            ExerciseViewWatch(viewModel: ExerciseViewModel())
            ConfigExerciseView(viewModel: AdjustExerciseViewModel(), rootIsActive: $rootIsActive)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
