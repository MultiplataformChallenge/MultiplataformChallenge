//
//  InitialView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 20/05/21.
//swiftlint:disable colon
//swiftlint:disable multiple_closures_with_trailing_closure

import SwiftUI

var viewModel = InitialViewModel()

struct InitialView: View {

    @State var exerciseIsActive: Bool = false
    @State var isActive: Bool = false
    @State private var showingSheet = false
    @State var selectedItem: Int = 0
    
    var body: some View {
        #if os(watchOS)
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<viewModel.categories.count) { item in
                    Button(action: {
                        selectedItem = item
                        isActive = true
                    }) {
                        ExerciseCellWatch(cardIndex: item, category: viewModel.categories[item])
                            .padding()
                            .frame(width: 164, height: 118)
                            .modifier(CardModifier())
                    }
                    .buttonStyle(PlainButtonStyle())
                    // Clear background

                }
                .background(
                    NavigationLink(destination: TabBar(rootIsActive: self.$isActive, exerciseViewModel: ExerciseViewModel(currentExercises: viewModel.categories[selectedItem].exercises), targetCount: CGFloat(viewModel.categories[selectedItem].exercises[0].duration)).navigationBarBackButtonHidden(true), isActive: self.$isActive) {

                    }
                )
            }
        }
        #else
        NavigationView {
            VStack(alignment: .trailing) {
                CircleButton(imageName: "gear", size: 60, fontSize: 30, action: {showingSheet.toggle()}, hasImage: true)
                        .frame(width:100, height:70, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.all, 0)
                    .sheet(isPresented: $showingSheet) {
                        SettingsView(showSheetView: $showingSheet)
                    }
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(0..<viewModel.categories.count) { item in
                        Button(action: {
                            selectedItem = item
                            isActive = true
                        }) {
                            ExerciseCellIOS(cardIndex: item, category: viewModel.categories[item])
//                                .padding()
                                .frame(width: 358, height: 366)
                                .modifier(CardModifier())
                                .padding([.all], 10)
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                    .background(
                        NavigationLink(destination: ExerciseiOSView(viewModel: ExerciseViewModel(currentExercises: viewModel.categories[selectedItem].exercises), adjustViewModel: AdjustExerciseViewModel(), isModalVisible: false, exerciseIsActive: self.$exerciseIsActive, targetCount: CGFloat(viewModel.categories[selectedItem].exercises[0].duration)).navigationBarBackButtonHidden(true), isActive: self.$isActive) {

                        }
                        .navigationBarHidden(true)
                    )
                }
            }
            .modifier(BackgroundModifier())
    //        .ignoresSafeArea()
        }
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

//NavigationView {
//    VStack(alignment: .trailing) {
//        CircleButton(imageName: "gear", size: 60, fontSize: 30, action: {showingSheet.toggle()}, hasImage: true)
//                .frame(width:100, height:70, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .padding(.all, 0)
//            .sheet(isPresented: $showingSheet) {
//                SettingsView(showSheetView: $showingSheet)
//            }
//        ScrollView(.vertical, showsIndicators: false) {
//            ForEach(0..<viewModel.categories.count) { item in
//                ExerciseCellIOS(cardIndex: item, category: viewModel.categories[item])
//            }
//        }
//    }
//    .modifier(BackgroundModifier())
//        .ignoresSafeArea()
//}
