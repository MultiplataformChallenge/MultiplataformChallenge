//
//  InitialView.swift
//  watchOS WatchKit Extension
//
//  Created by Jhennyfer Rodrigues de Oliveira on 21/05/21.
//

import Foundation
import SwiftUI

struct ExerciseCellWatch: View {
    var cardIndex: Int
    var exercise: ExerciseModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 2.0) {
                Text(verbatim: exercise.name)
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(2)
                
                Text("\(exercise.duration) Exercício")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
                
                Text("\(exercise.duration) min")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .lineLimit(1)
            }
            .frame(width: 125, height: 110, alignment: .leading)
            .padding(.bottom, 20)
            .padding([.leading, .top], 12.0)
            .offset(x: -15)
            
            exercise.imageExercise
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 40)
                .padding(.top, 36.0)
                .padding(.bottom, 12.0)
                .offset(x: 55)
        }
        .frame(width: 164, height: 118)
        .modifier(CardModifier())
        .onTapGesture {
            print(cardIndex)
                
        }
    }
}
