//
//  InitialView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//

import SwiftUI

var viewModel = InitialViewModel()

struct InitialView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<viewModel.categories.count) { item in
                #if os(watchOS)
                ExerciseCellWatch(cardIndex: item, category: viewModel.categories[item])
                #else
                ExerciseCellIOS(cardIndex: item, category: viewModel.categories[item])
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

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
