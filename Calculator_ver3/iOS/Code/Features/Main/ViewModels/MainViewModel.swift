//
//  MainViewModel.swift
//  Calculator_ver3
//
//  Created by MIKHAIL ZHACHKO on 9.12.23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
//    MARK: - Variables
    
    /// Holder for calculator input and result
    @Published var result: String = ""
    @Published var resultReady: Bool = false
    
    let operations: String = "+-*/%"
    
    /// Identify the current selected operation
    var currentOperation: Operations = .unknown
    
    let maxCalculationInput: Int = 10
    
//    MARK: - Functions
    
    ///Calculate the value of the inputs
    func calculate(){
        guard (!operations.contains(result.suffix(1))) else { return }
        
        let expression: NSExpression = NSExpression(format: result)
        guard let computedValue: Double = expression.expressionValue(with: nil, context: nil) as? Double else { return }
        
        self.result = computedValue.clean(places: 3)
        self.currentOperation = .unknown
        self.resultReady = true
    }
    
    /// Set  current operation and perform actions like decimal or percentage
    func setOperation(operation: Operations){
        switch operation {
        
        case .plusMinus:
            guard let input: Double = Double(result) else { return }
            self.result = (-input).clean(places: 3)
            self.currentOperation = .unknown
            
        case .percentage:
            guard let input: Double = Double(result) else { return }
            self.result = (input * 0.01).clean(places: 3)
            self.currentOperation = .unknown
            
        default:
            break
        }
    }
    
    /// Add an Operation to the Calculator input
    func addOperation(operation: Operations){
        if (currentOperation != .unknown){
            if operations.contains(result.suffix(1)){
                self.result.removeLast()
                result += currentOperation.rawValue
                self.currentOperation = operation
                return
            }
            calculate()
        }
        result += operation.rawValue
        self.currentOperation = operation
    }
    
    ///Perform the action for the various Calculator Button
    func performAction(for pad: DialPad){
        switch pad {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
            guard (!resultReady || currentOperation != .unknown) else { return }
            
            guard result.count <= maxCalculationInput else { return }
            
            self.result += pad.rawValue
            
        case .add:
            self.addOperation(operation: .plus)
            
        case .subtract:
            self.addOperation(operation: .minus)
            
        case .multiply:
            self.addOperation(operation: .multiply)
            
        case .divide:
            self.addOperation(operation: .divide)
            
        case .equal:
            self.calculate()
            
        case .clear:
            reset()
            
        case .decimal:
            guard (currentOperation != .unknown || !result.contains(pad.rawValue)) else { return }
            self.result += pad.rawValue
            
            
        case .present:
            self.setOperation(operation: .percentage)
            
        case .negative:
            self.setOperation(operation: .plusMinus)
            
        case .revert:
            self.reset()
        }
    }
    
    ///Reset the variables and start a new
    func reset(){
        self.result = ""
        self.currentOperation = .unknown
        self.resultReady = false
    }
}
