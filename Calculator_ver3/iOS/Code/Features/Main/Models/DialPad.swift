//
//  NumPad.swift
//  Calculator_ver3
//
//  Created by MIKHAIL ZHACHKO on 9.12.23.
//

import Foundation

enum DialPad: String {
    
//    MARK: Numbers
    case one        = "1"
    case two        = "2"
    case three      = "3"
    case four       = "4"
    case five       = "5"
    case six        = "6"
    case seven      = "7"
    case eight      = "8"
    case nine       = "9"
    case zero       = "0"
//    MARK: Operations
    case add        = "+"
    case subtract   = "-"
    case multiply   = "×"
    case divide     = "÷"
    case equal      = "="
    case clear      = "AC"
    case decimal    = "."
    case present    = "%"
    case negative   = "+/-"
    case revert     = "∅"
    
//    MARK: - Functions
    func getOperator() -> String {
        switch self {
        
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "."
        default:
            return ""
        }
    }
    
    
}
