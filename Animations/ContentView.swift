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


struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct SandBoxView: View {
    
    @State private var animationAmount = 1.0
    @State private var enabled = false
    
    @State private var dragAmount = CGSize.zero
    @State private var isShowingRed = false
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
        
        /**** Showing and Hiding views with transitions *****/
        //        VStack {
        //            Button("Tap Me") {
        //
        //                withAnimation {
        //                    isShowingRed.toggle()
        //                }
        //            }
        //
        //            if isShowingRed {
        //                Rectangle()
        //                    .fill(.red)
        //                    .frame(width: 200, height: 200)
        //                    //.transition(.scale)
        //                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
        //            }
        //        }
        //
        
        /**** Beyond this point is gesture animation *****/
        //        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        //                    .frame(width: 300, height: 200)
        //                    .clipShape(.rect(cornerRadius: 10))
        //                    .offset(dragAmount)
        //                    .gesture(DragGesture()
        //                        .onChanged({ gesture in
        //                            dragAmount = gesture.translation
        //                        })
        //                        .onEnded({ _ in
        //                            dragAmount = .zero
        //                        })
        //                    )
        //                    .animation(.bouncy, value: dragAmount)
        
        
        
        
        
        /****  Beyond this point is animations  ****/
        
        //        Button("Tap Me") {
        //            enabled.toggle()
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(enabled ? .blue : .red)
        //        .animation(nil, value: enabled)
        //        .foregroundStyle(.white)
        //        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        //        .animation(.spring(duration: 5, bounce: 0.6), value: enabled)
        
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
        
        
        VStack {
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
        }
            //
            //
            //            VStack {
            //                Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            //
            //                Spacer()
            //
            //                Button("Tap Me") {
            //                    animationAmount += 1
            //                }
            //                .padding(40)
            //                .background(.red)
            //                .foregroundStyle(.white)
            //                .clipShape(.circle)
            //                .scaleEffect(animationAmount)
            //            }
            //        }
        }
    }
