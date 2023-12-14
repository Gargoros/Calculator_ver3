//
//  CalculatorButtons.swift
//  Calculator_ver3
//
//  Created by MIKHAIL ZHACHKO on 11.12.23.
//

import SwiftUI

struct CalculatorButtons: View {
//    MARK: - Variables
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var stackSpacing: CGFloat = 0
    
    
//    MARK: - Views
    var body: some View {
        VStack(alignment: .leading, spacing: stackSpacing - 4){
            Spacer()
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .clear, color: .teal)
                CalculatorPad(dialPad: .negative, color: .teal)
                CalculatorPad(dialPad: .present, color: .teal)
                CalculatorPad(dialPad: .divide, color: .orange)
            }
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .seven)
                CalculatorPad(dialPad: .eight)
                CalculatorPad(dialPad: .nine)
                CalculatorPad(dialPad: .multiply, color: .orange)
            }
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .four)
                CalculatorPad(dialPad: .five)
                CalculatorPad(dialPad: .six)
                CalculatorPad(dialPad: .subtract, color: .orange)
            }
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .one)
                CalculatorPad(dialPad: .two)
                CalculatorPad(dialPad: .three)
                CalculatorPad(dialPad: .add, color: .orange)
            }
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .zero)
                HStack(spacing: stackSpacing) {
                    CalculatorPad(dialPad: .decimal)
                    CalculatorPad(dialPad: .equal, color: .orange)
                }
                
            }
        }
        .environmentObject(mainViewModel)
    }
}

#Preview {
    CalculatorButtons(stackSpacing: 24)
        .frame(height: 450)
        .padding(24)
        .environmentObject(MainViewModel())
}
