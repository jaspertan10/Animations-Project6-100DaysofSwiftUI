//
//  ContentView.swift
//  Animations
//
//  Created by Jasper Tan on 11/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    //ContentView()
    SandBoxView()
}

struct SandBoxView: View {
    
    @State private var animationAmount = 1.0
    
    
    var body: some View {
        

//        Button("Tap Me") {
//            animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundStyle(.white)
//        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1))
//        .animation(
//            .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: false),
//            value: animationAmount
//        )
        
    
            print(animationAmount)

            return VStack {
            /* Button with overlay circle*/
            Button("Tap Me") {
                // animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
            
            Spacer()
            
            
            VStack {
                Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
                
                Spacer()
                
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.circle)
                .scaleEffect(animationAmount)
            }
        }
    }
}
