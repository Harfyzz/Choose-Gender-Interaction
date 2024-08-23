//
//  ContentView.swift
//  Choose Gender Interaction
//
//  Created by Afeez Yunus on 22/08/2024.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    
    @State var genderGroup = RiveViewModel(fileName: "gender_select", fit: .contain)
    @State var isTapped = false
    var body: some View {
        VStack {
                HStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.left")
                            .padding(12)
                            .foregroundStyle(Color(.white).opacity(0.6))
                            .background(Color("object"))
                            .clipShape(RoundedRectangle(cornerRadius: 24 ))
                    })
                    Spacer()
                    
                }
            VStack(spacing:16){
                HStack{
                    Text("Select Gender")
                        .fontWeight(.medium)
                    Spacer()
                    Text("3 of 6")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .overlay {
                            RoundedRectangle(cornerRadius: 32)
                                .stroke()
                                .foregroundColor(Color("secondary bg"))
                        }
                    
                }
                .foregroundColor(.white.opacity(0.6))
                ProgressView(value: 0.33)
                    .progressViewStyle(.linear)
                    .tint(Color("primary orange"))
            }
            Spacer()
                .frame(height: 32)
            Text("Choose Gender")
                .fontWeight(.bold)
            genderGroup.view()
                .frame(width: 360)
                .onTapGesture {
                    isTapped = true
                }
            
            Spacer()
            VStack(spacing:16){
                Text("Choose the gender your physiology best aligns with. Gender is used to calibrate Elite algorithms such as calorie burn, sleep needed, and more.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.6))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Continue")
                        .padding()
                        .fontWeight(.medium)
                        .foregroundStyle(Color("object"))
                        .frame(width: 313)
                        .background(.white.opacity(isTapped ? 1.0 : 0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 64))
                })
            }
        }.preferredColorScheme(.dark)
            .padding(.horizontal, 16)
    }
}

#Preview {
    ContentView()
}
