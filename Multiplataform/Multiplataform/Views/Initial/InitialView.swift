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
        
        #if os(watchOS)
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<viewModel.categories.count) { item in
                NavigationLink(destination: ExerciseViewWatch(viewModel: ExerciseViewModel())) {
                    ExerciseCellWatch(cardIndex: item, category: viewModel.categories[item])
                        .navigationBarBackButtonHidden(true)
                }
                
                .frame(width: 164, height: 118, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            }
        }
        #else
        VStack(alignment: .trailing) {
                CircleButton(imageName: "gear", size: 60, fontSize: 30, action: {print("pressed")}, hasImage: true)
                    .frame(width: 100, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.all, 0)

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<viewModel.categories.count) { item in
                    ExerciseCellIOS(cardIndex: item, category: viewModel.categories[item])
                }
            }
        }
        .modifier(BackgroundModifier())
        .ignoresSafeArea()
        #endif   
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
