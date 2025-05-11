
import SwiftUI

//MARK: Custom Shape to render Display
struct DisplayShape: Shape {
//MARK: - Function
    func path(in rect: CGRect) -> Path {
        /// Center X * Center Y to draw the Path
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
        var path: Path = Path()
        path.move(to: CGPoint(x: 0, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: 0))
        path.addLine(to: CGPoint(x: cX / 2 - 40, y: 0))
        path.addLine(to: CGPoint(x: 0, y: cY - 60))
        path.closeSubpath()
        return path
    }
}
