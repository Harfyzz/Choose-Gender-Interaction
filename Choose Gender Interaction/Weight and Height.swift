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
    @State var unit = ""
    @State private var selection = (2, 9, 74) // 5ft 9in (2+3), 124lbs (74+50)
        
        let feetData = Array(3...7).map { "\($0)" }
        let inchesData = Array(0...11).map { "\($0)" }
        let poundsData = Array(50...300).map { "\($0)" }
        
        let cmData = Array(100...220).map { "\($0)" }
        let kgData = Array(30...150).map { "\($0)" }
    
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
                .frame(height: 48)
            
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
                        withAnimation (.easeInOut(duration: 0.2)){
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
                        withAnimation(.easeInOut(duration: 0.2)) {
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
                .padding(.bottom, 16)
            
            //cards
            HStack {
                            weightCard
                            heightCard
                        }
                        
            if isImperial {
                CustomPicker(selection: $selection, data: [feetData, inchesData, poundsData])
                    .frame(height: 200)
            } else {
                CustomPicker(selection: $selection, data: [cmData, kgData, [""]])
                    .frame(height: 200)
            }
            Spacer()
            VStack(spacing:16){
                Text("This information will help us establish your physiological profile. By selecting 'Next', I consent to the processing of data concerning my health.")
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
    private var weightCard: some View {
            HStack {
                VStack(alignment: .leading, spacing: 48) {
                    Image("weight")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Weight")
                            .foregroundStyle(.white.opacity(0.6))
                        HStack(alignment: .bottom, spacing: 4) {
                            Text(isImperial ? "\(poundsData[selection.2])" : "\(kgData[selection.1])")
                                .fontWeight(.semibold)
                                .font(.system(size: 24))
                            Text(isImperial ? "lbs" : "kg")
                                .font(.system(size: 14))
                                .foregroundStyle(.white.opacity(0.6))
                        }
                    }
                }
                Spacer()
            }.padding()
                .background(Color("secondary bg"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke()
                        .foregroundColor(Color("object"))
                }
        }
        
        private var heightCard: some View {
            HStack {
                VStack(alignment: .leading, spacing: 48) {
                    Image("height")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Height")
                            .foregroundStyle(.white.opacity(0.6))
                        if isImperial {
                            HStack(alignment: .bottom, spacing: 4) {
                                Text("\(feetData[selection.0])'\(inchesData[selection.1])\"")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24))
                            }
                        } else {
                            HStack(alignment: .bottom, spacing: 4) {
                                Text("\(cmData[selection.0])")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24))
                                Text("cm")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white.opacity(0.6))
                            }
                        }
                    }
                }
                Spacer()
            }.padding()
                .background(Color("secondary bg"))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke()
                        .foregroundColor(Color("object"))
                }
        }
        
    private func segmentButton(for imperialValue: Bool, text: String) -> some View {
        ZStack {
            if isImperial == imperialValue {
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color("object"))
                    .frame(height: 40)
                    .matchedGeometryEffect(id: "background", in: animation)
            }
            Text(text)
                .padding()
                .foregroundStyle(.white.opacity(isImperial == imperialValue ? 1.0 : 0.6))
                .fontWeight(isImperial == imperialValue ? .semibold : .regular)
        }.frame(width: 120, height: 40)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isImperial = imperialValue
                    resetSelection()
                }
            }
    }
        
    private func resetSelection() {
        if isImperial {
            selection = (2, 9, 74) // 5ft 9in, 124lbs
        } else {
            selection = (75, 34, 0) // 175cm, 64kg
        }
    }
    
}

#Preview {
    Weight_and_Height()
}
