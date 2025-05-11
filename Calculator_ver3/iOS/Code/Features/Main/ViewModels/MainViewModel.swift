
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var result: String = ""
    @Published var resultReady = false
    let operations = "+-*/%"
    var currentOperation: Operations = .unknown
    let maxCalculationInput = 10
    
    func calculate() {
        guard let last = result.last, !operations.contains(last) else {
            result = "0"
            return
        }
        if result.contains("/0") {
            result = "Error"
            return
        }
        if result.isEmpty || result.first == "/" || result.first == "*" || result.first == "+" || result.first == "-" {
            result = "0"
            return
        }
        if result.last == "+" || result.last == "-" || result.last == "*" || result.last == "/" {
            result = "0"
            return
        }
        var exprString = result
        exprString = exprString
            .replacingOccurrences(of: "%", with: "*0.01")
            .replacingOccurrences(of: "*", with: "*")
            .replacingOccurrences(of: "/", with: "/")
        if exprString.last == "." {
            exprString += "0"
        }
        let intRegex = #"(?<=^|[+\-*/%])(\d+)(?=$|[+\-*/%])"#
        exprString = exprString.replacingOccurrences(of: intRegex, with: "$1.0", options: .regularExpression)
        let expr = NSExpression(format: exprString)
        guard let dbl = expr.expressionValue(with: nil, context: nil) as? Double else {
            result = "Error"
            return
        }
        result = String(format: "%.3f", dbl)
        result = cleanResult(result)
        currentOperation = .unknown
        resultReady = true
    }
    func cleanResult(_ result: String) -> String {
        var cleanedResult = result
        if cleanedResult.contains(".") {
            while cleanedResult.last == "0" {
                cleanedResult.removeLast()
            }
            if cleanedResult.last == "." {
                cleanedResult.removeLast()
            }
        }
        return cleanedResult
    }
    func setOperation(operation: Operations) {
        switch operation {
            case .plusMinus:
                guard let input = Double(result) else { return }
                result = (-input).clean(places: 3)
                currentOperation = .unknown
                
            case .percentage:
                guard let input = Double(result) else { return }
                result = (input * 0.01).clean(places: 3)
                currentOperation = .unknown
                
            default: break
        }
    }
    func addOperation(operation: Operations) {
        if currentOperation != .unknown {
            if operations.contains(result.suffix(1)) {
                result.removeLast()
                result += currentOperation.rawValue
                currentOperation = operation
                return
            }
            calculate()
        }
        result += operation.rawValue
        currentOperation = operation
    }
    func performAction(for pad: DialPad) {
        switch pad {
            case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero:
                guard (!resultReady || currentOperation != .unknown) else { return }
                guard result.count <= maxCalculationInput else { return }
                result += pad.rawValue
            case .add:      addOperation(operation: .plus)
            case .subtract: addOperation(operation: .minus)
            case .multiply: addOperation(operation: .multiply)
            case .divide:   addOperation(operation: .divide)
            case .equal:    calculate()
            case .clear:    reset()
            case .decimal:
                guard currentOperation != .unknown || !result.contains(pad.rawValue) else { return }
                result += pad.rawValue
            case .present:  setOperation(operation: .percentage)
            case .negative: setOperation(operation: .plusMinus)
            case .revert:   reset()
        }
    }
    func reset() {
        result = ""
        currentOperation = .unknown
        resultReady = false
    }
}
