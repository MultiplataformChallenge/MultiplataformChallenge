//
//  InfoView.swift
//  Multiplataform
//
//  Created by Brena Amorim on 26/05/21.
//

import SwiftUI

struct InfoView: View {
    @State var isModalVisible = false
    
    var body: some View {
        ZStack {
            Button(action: {
                isModalVisible.toggle()
            }, label: {
                Text("Show modal")
                    .frame(width: 120, height: 60)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            })
            
            if isModalVisible {
//                ModalView(isVisible: $isModalVisible)
            }
        }
    }
}

struct ModalView: View {
    @State var isVisible: Bool = true
//    @Binding var isVisible: Bool = true
    
    var body: some View {
        ZStack {
            Color.primary.opacity(0.3)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Info")
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    
                    Button(action: {
                        toggleVisible()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.lightPurple)
                            .padding(8)
                            .background(Color(UIColor.systemBackground))
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    })
                }
                
                Text("Flexao coxa")
                    .font(Font.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.top, 20)
                
                Text("Lorem Ipsum lakjlskjskjalkjl")
                    .font(Font.system(size: 18, weight: .medium, design: .rounded))
                    .padding(.top, -4)

            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(15)
            .padding()
        }
    }
    
    func toggleVisible() {
        isVisible.toggle()
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .preferredColorScheme(.dark)
    }
}
