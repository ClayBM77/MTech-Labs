//
//  ContentView.swift
//  ButtonsLab
//
//  Created by Bridger Mason on 9/29/25.
//

import SwiftUI


struct NewButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .font(.custom("Al Nile", size: 20))
            .foregroundColor(.white)
            .padding()
            .background(
                Capsule()
                    .foregroundStyle(.mint))
    }
}



struct ContentView: View {
    
    @State private var count: Double = 1
    func upCount() {
        count += 1
    }
    
    @State private var isPressed = false
    func pressed() {
        isPressed.toggle()
    }
    
    @State var isDisabled = true
    @State private var bgColor: Color = .clear
    @State private var dogRotation: Double = 0
    @State private var button1Pressed = false
    
    var body: some View {
        HStack{
            VStack {
                Button(action: { button1Pressed.toggle() } ) {
                    Text("Button 1")
                        
                }
                .frame(maxWidth: .infinity)
                .font(.custom("Al Nile", size: 20))
                .foregroundColor(button1Pressed ? .mint : .white)
                .padding()
                .background(
                    Capsule()
                        .foregroundStyle(.mint))
                .padding()
                .overlay(button1Pressed ? Text("NO") : Text(""))
                
                Button(action: {
                    withAnimation(.linear(duration: 0.6)) {
                        dogRotation += 360
                    }
                }) {
                    Image(systemName: "dog")
                        .rotationEffect(.degrees(dogRotation))
                }
                .scaleEffect(2)
                .padding()
                Button(action: { upCount() } ) {
                    Text("Button \(Int(count))?")
                }
                .padding()
                .glassEffect()
                .scaleEffect(count)
                .zIndex(1)
                
                
                
                Button(action: { pressed() } ) {
                    Text("Button 4")
                    
                }
                .foregroundStyle(isPressed ? .black : .mint)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    Capsule()
                        .foregroundStyle(isPressed ? .mint : .black))
                .padding()
                
                Button("Button 5") {
                   isDisabled = true
                        
                }
                .buttonStyle(NewButtonStyle())
                .disabled(isDisabled)
                .opacity(isDisabled ? 0.5 : 1)
            }
            .padding()
            .zIndex(1)
            VStack {
                Button(action: { withAnimation { bgColor = .green } } ) {
                    Text("Button 6")
                        
                }
                .buttonStyle(NewButtonStyle())
                .padding()
                Button("Button 7") {
                    isDisabled = false
                    
                }
                .buttonStyle(NewButtonStyle())
                .padding()
                Button(action: { withAnimation { bgColor = .red } } ) {
                    Text("Button 8")
                        
                }
                .buttonStyle(NewButtonStyle())
                .padding()
                Button(action: { withAnimation { bgColor = .orange } } ) {
                    Text("Button 9")
                        
                }
                .buttonStyle(NewButtonStyle())
                .padding()
                Button(action: { withAnimation { bgColor = .blue } } ) {
                    Text("Button 10")
                        
                }
                .buttonStyle(NewButtonStyle())
                .padding()
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
        .ignoresSafeArea()
    }
        
}


#Preview {
    ContentView()
}
