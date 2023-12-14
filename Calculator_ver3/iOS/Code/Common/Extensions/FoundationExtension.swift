//
//  FoundationExtension.swift
//  Calculator_ver3
//
//  Created by MIKHAIL ZHACHKO on 9.12.23.
//

import Foundation

//MARK: Extension to convert all Decimal to String

extension Double {
    func clean(places: Int) -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.\(places)f", self)
    }
}
