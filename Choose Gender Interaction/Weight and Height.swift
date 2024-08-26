//
//  Weight and Height.swift
//  Choose Gender Interaction
//
//  Created by Afeez Yunus on 26/08/2024.
//

import SwiftUI

struct Weight_and_Height: View {
    
    @State var isImperial = true
    @Namespace var animation
    
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
                    Text("Weight & Height")
                        .fontWeight(.medium)
                    Spacer()
                    Text("5 of 7")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .overlay {
                            RoundedRectangle(cornerRadius: 32)
                                .stroke()
                                .foregroundColor(Color("object"))
                        }
                    
                }
                .foregroundColor(.white.opacity(0.6))
                ProgressView(value: 0.7)
                    .progressViewStyle(.linear)
                    .tint(Color("primary orange"))
            }
            Spacer()
                .frame(height: 32)
            
            // segmented tab
            HStack(spacing: 4) {
                ZStack {
                    if isImperial {
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color("object"))
                            .frame(height: 40)
                            .matchedGeometryEffect(id: "background", in: animation)
                    }
                    Text("Imperial")
                        .padding()
                        .foregroundStyle(.white.opacity(isImperial ? 1.0 : 0.6))
                        .fontWeight(isImperial ? .semibold : .regular)
                }.frame(width:120, height: 40)
                    .onTapGesture {
                        withAnimation {
                            isImperial = true
                        }
                    }
                
                ZStack {
                    if !isImperial {
                        RoundedRectangle(cornerRadius: 32)
                            .fill(Color("object"))
                            .frame(height: 40)
                            .matchedGeometryEffect(id: "background", in: animation)
                    }
                    Text("Metric")
                        .padding()
                        .foregroundStyle(.white.opacity(isImperial ? 0.6 : 1.0))
                        .fontWeight(isImperial ? .regular : .semibold)
                }.frame(width:120, height: 40)
                    .onTapGesture {
                        withAnimation {
                            isImperial = false
                        }
                    }
            }.padding(4)
                .background(Color("secondary bg"))
                .clipShape(RoundedRectangle(cornerRadius: 64))
                .overlay {
                    RoundedRectangle(cornerRadius: 64)
                        .stroke()
                        .foregroundColor(Color("object"))
                }
            
            Spacer()
            VStack(spacing:16){
                Text("This information will help us to establish your physiological profile. By selecting 'Next', I consent to the processing of data concerning my health.")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white.opacity(0.6))
                Button(action: {
                    
                }, label: {
                    Text("Continue")
                        .padding()
                        .fontWeight(.medium)
                        .foregroundStyle(Color("object"))
                        .frame(width: 313)
                        .background(.white.opacity(1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 64))
                })
            }
        }.preferredColorScheme(.dark)
            .padding(.horizontal, 16)
    }
}

#Preview {
    Weight_and_Height()
}
