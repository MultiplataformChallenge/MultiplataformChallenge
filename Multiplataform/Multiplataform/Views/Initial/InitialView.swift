//
//  InitialView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//swiftlint:disable colon

import SwiftUI

var viewModel = InitialViewModel()

struct InitialView: View {

    @State var isActive: Bool = false
    @State private var showingSheet = false
    
    var body: some View {
        #if os(watchOS)
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<viewModel.categories.count) { item in
                    NavigationLink(destination: TabBar(rootIsActive: self.$isActive).navigationBarBackButtonHidden(true), isActive: self.$isActive) {
                        ExerciseCellWatch(cardIndex: item, category: viewModel.categories[item])
                    }
                    .frame(width: 164, height: 118, alignment: .center)
                    .cornerRadius(20)
                }
            }
        }
        #else
        VStack(alignment: .trailing) {
            CircleButton(imageName: "gear", size: 60, fontSize: 30, action: {showingSheet.toggle()}, hasImage: true)
                    .frame(width:100, height:70, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.all, 0)
                .sheet(isPresented: $showingSheet) {
                    SettingsView(showSheetView: $showingSheet)
                }
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<viewModel.categories.count) { item in
                    ExerciseCellIOS(cardIndex: item, category: viewModel.categories[item])
                }
            }
        }
        .modifier(BackgroundModifier())
//        .ignoresSafeArea()
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
