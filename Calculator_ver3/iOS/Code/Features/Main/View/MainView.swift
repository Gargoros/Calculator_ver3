//
//  ContentView.swift
//  Calculator_ver3
//
//  Created by MIKHAIL ZHACHKO on 9.12.23.
//

import SwiftUI

struct MainView: View {
    
    //MARK: - Variables
    @EnvironmentObject var mainViewModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let duration: TimeInterval = 0.3
    
    //MARK: - Views
    var body: some View {
        GeometryReader{geometry in

            let height: CGFloat = geometry.size.height
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
                Color.background
                    .ignoresSafeArea(.all)
                VStack(alignment: .leading, spacing: 28){
                    
//                    MARK: Casio Title Text
                    HStack{
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Casio")
                                .font(.custom("EurostileBold", size: 26))
                            Text("Calculator")
                                .tracking(1.2)
                                .font(.system(size: 20, weight: .medium, design: .monospaced))
                                .opacity(0.25)
                                .offset(x: 2)
                                
                        }
                        .textCase(.uppercase)
                        
                        Spacer()
//                        MARK: Four cells
                        HStack(){
                            ForEach(0..<4) { _ in
                                Rectangle()
                                    .foregroundStyle(.gray)
                                    .frame(width: 20, height: 20)
                            }
                        }
                        
                    }
//                    MARK: -> Render Display View
                    DisplayView(height: height, colorScheme: colorScheme, duration: duration)
                        .environmentObject(mainViewModel)
                        .padding(.horizontal, -3)
//                     MARK: -> Render Calculator Buttons View
                    CalculatorButtons(stackSpacing: 10)
                        .environmentObject(mainViewModel)
                    
                }
                
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}
