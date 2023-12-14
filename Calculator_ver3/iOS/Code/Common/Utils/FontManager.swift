//
//  FontManager.swift
//  Calculator_ver3
//
//  Created by MIKHAIL ZHACHKO on 9.12.23.
//

import SwiftUI

//MARK: Enum for Fonts -> for easiest apply them for using the Font Modifier

enum TypefaceOne {
    
    case regular
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("BungeeLayers-Regular", size: size)
        }
    }
    
}
