
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
