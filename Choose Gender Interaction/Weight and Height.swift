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
    @State var weightUnit = 10
    @State var heightUnit = 10
    @State var inchUnit = 0
    
    
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
                .padding(.bottom, 8)
            
            //cards
            HStack{
                HStack {
                    VStack(alignment:.leading, spacing:48){
                        Image("weight")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                        VStack(alignment:.leading,spacing:4){
                            Text("Weight")
                                .foregroundStyle(.white.opacity(0.6))
                            HStack(alignment:.bottom, spacing:4){
                                Text(String(weightUnit))
                                    .fontWeight(.semibold)
                                    .font(.system(size: 24))
                                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: weightUnit)
                                    .contentTransition(.numericText())
                                Text(isImperial ? "lbs" : "kg")
                                    .id("unit")
                                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: "unit")
                                    .contentTransition(.numericText())
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
                HStack {
                    VStack(alignment:.leading, spacing:48){
                        Image("height")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                        VStack(alignment:.leading,spacing:4){
                            Text("Height")
                                .foregroundStyle(.white.opacity(0.6))
                            HStack (spacing:16){
                                HStack(alignment:.bottom, spacing:4){
                                    Text(String(heightUnit))
                                        .fontWeight(.semibold)
                                        .font(.system(size: 24))
                                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: heightUnit)
                                        .contentTransition(.numericText())
                                    Text(isImperial ? "ft" : "m")
                                        .id("unit")
                                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: "unit")
                                        .contentTransition(.numericText())
                                }
                                if isImperial {
                                    HStack(alignment:.bottom, spacing:4){
                                        Text(String(inchUnit))
                                            .fontWeight(.semibold)
                                            .font(.system(size: 24))
                                            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: inchUnit)
                                            .contentTransition(.numericText())
                                        Text("in")
                                    }
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
            
                HStack(spacing:8){
                    VStack {
                        Picker("", selection: $weightUnit) {
                            let weightRange = 10...500
                            ForEach(weightRange, id: \.self) { weight in
                                HStack{
                                    Text("\(weight)").tag(weight)
                                    Text(isImperial ? "lbs" : "kg")
                                }
                            }
                        }.pickerStyle(.wheel)
                    }
                    
                    VStack {
                        HStack(spacing:0){
                            Picker("", selection: $heightUnit) {
                                let heightRange = 3...20
                                ForEach(heightRange, id: \.self) { weight in
                                    HStack{
                                        Text("\(weight)").tag(weight)
                                        Text(isImperial ? "ft" : "m")
                                    }
                                }
                            }.pickerStyle(.wheel)
                            if isImperial {
                                Picker("", selection: $inchUnit) {
                                    let inchRange = 0...12
                                    ForEach(inchRange, id: \.self) { weight in
                                        Text("\(weight) in").tag(weight)
                                    }
                                }.pickerStyle(.wheel)
                                
                            }
                        }
                    }
                }
            
            Spacer()
            VStack(spacing:16){
                Text("This information will help us establish your physiological profile. By selecting 'Next', I consent to the processing of data concerning my health.")
                    .font(.caption)
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
