
import SwiftUI

struct CalculatorPad: View {
//MARK: - Variables
    @EnvironmentObject var mainViewModel: MainViewModel
    @Environment(\.colorScheme) var colorSheme: ColorScheme
    @State var scale: CGFloat = 1
    @State var foregroundColor: Color = .white
    let animationDuration: TimeInterval = 0.15
    var dialPad: DialPad
    var color: Color = .label
    var rectForegroundColor: Color {
        return mainViewModel.currentOperation.rawValue == dialPad.getOperator() && mainViewModel.currentOperation != .unknown ? color.opacity(0.2) : .blue.opacity(0.15)
    }
//MARK: - Views
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(rectForegroundColor)
            .overlay{
                Text(dialPad.rawValue)
                    .font(TypefaceOne.regular.font(size: 30))
                    .foregroundStyle(color)
            }
            .scaleEffect(scale)
            .onTapGesture {
                self.mainViewModel.performAction(for: dialPad)
                withAnimation(.easeInOut(duration: animationDuration)){
                    scale = 0.95
                }
                Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false){ _ in
                    scale = 1
                }
            }
    }
}
